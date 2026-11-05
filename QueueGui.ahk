; =====================================================================
;  QueueGui.ahk - окно очереди античита (Numpad0 - показать / скрыть)
;
;  Подключается В САМОМ КОНЦЕ main.ahk (внутри есть хоткей).
;
;  Колонки: Ник | ID | Ур. | Тип (AC / RE = Reconnect) | Причина | xN | Время
;  Двойной клик по строке или кнопка "Взять" - взять игрока (как Num5 / Num6)
;  Спек   - только /re, без /a, запись остаётся в очереди
;  Скип   - убрать из очереди, не беря
;  A- / A+ - размер шрифта списка;  ползунок - прозрачность окна
;  Кнопка "Закрепить здесь" - зафиксировать окно в ЛЮБОМ месте, где оно стоит сейчас
;                              (повторно - "Открепить")
;  Список - прижать окно к краю / углу / центру экрана (или окна игры) либо "Своё место";
;  в закреплённом виде окно само возвращается на место - чтобы сдвинуть, нажми "Открепить".
;  Кнопка "Прозрачный фон" (или Ctrl+Numpad0) - режим HUD: фон, рамка и заголовки колонок полностью
;  прозрачны, текст белый, остаётся только текст строк и ползунок прозрачности; кнопки появляются,
;  когда курсор над окном ("Открепить" и "Обычный фон" - рядом с кнопками размера шрифта).
;  С обычным фоном: белое окно, чёрный текст (в списке и в строке "В очереди").
;  В прозрачном режиме: белый текст и в списке, и в строке "В очереди".
;  В прозрачном режиме окно двигается Ctrl + левая кнопка мыши (за текст), размер - как задан.
;  ВАЖНО: прозрачные места пропускают клики сквозь себя (в игру).
;  Все настройки запоминаются в queue_window.ini
;
;  Тема: фиолетовая, цвета в queue_window.ini, раздел [theme] (см. Theme.ahk). Мини-окно очереди: MiniWin.ahk (Ctrl+Numpad9).
;  Размер окна меняется мышью (в обычном и в прозрачном режиме отдельно) и запоминается.
;
;  Ширина колонок: потяни границы в заголовке (обычный режим) - она запомнится в queue_window.ini
;  и будет такой же всегда, в том числе в прозрачном режиме. Сбросить: удалить строки ColW1..ColW7 из ini.
;
;  Быстрые ответы (пока следишь за игроком из очереди; не работают, если открыт чат - тогда цифры печатаются):
;    Numpad1 - "ID норм"   Numpad2 - "ID лосс"   Numpad3 - "ID пинг"   Numpad4 - "ID лосс + пинг"
;  После ответа цель закрывается (как после Num5 + ответа вручную).
;
;  Отправка в /a идёт через очередь: по одному сообщению, пауза между ними 1 с, пустые не отправляются.
;  Если чат открыт - чат на миг закрывается, сообщение уходит, чат открывается снова и текст возвращается.
;
;  xN - сколько раз ник попадал в очередь за эту сессию (возможно + Reconnect).
;  Считается по НИКУ, потому что после Reconnect ID меняется.
; =====================================================================
global ACQ_Built, ACQ_Visible, ACQ_Sig, ACQ_PosX, ACQ_PosY, ACQ_LV, ACQ_B1, ACQ_B2, ACQ_B3
global ACQ_PinSel, ACQ_AlphaS, ACQ_Hwnd, ACQ_Alpha, ACQ_Pin, ACQ_CW, ACQ_CH, ACQ_LastTitle
global ACQ_FontSize, ACQ_BF1, ACQ_BF2, ACQ_BPin, ACQ_PinX, ACQ_PinY
global ACQ_Trans, ACQ_BTrans, ACQ_Status, ACQ_CtlShown, ACQ_LeaveTick, ACQ_ColW
global ACQ_LastA, ACQ_SendQ, ACQ_WatchPos, ACQ_BanReason
global ACQ_SpecID, ACQ_SpecNick, ACQ_SpecType, ACQ_SpecTick, ACQ_TakeTick

Numpad0::
    ACQ_Toggle()
    return

^Numpad0::
    ACQ_ToggleTrans()
    return

#If ACQ_QuickOK()
Numpad1::ACQ_QuickReply("норм")
Numpad2::ACQ_QuickReply("лосс")
Numpad3::ACQ_QuickReply("пинг")
Numpad4::ACQ_QuickReply("лосс + пинг")
#If

; ---------------------------------------------------------------------
;  Обработка строк античита: одна запись на игрока, повторы дописываются
; ---------------------------------------------------------------------
ACQ_AddEvent(type, nick, id, level, reason) {
    global AC_Queue, AC_Counts
    ACQ_EnsureReader()
    if (!IsObject(AC_Counts))
        AC_Counts := {}
    StringLower, key, nick
    cnt := 1
    if (key != "") {
        cnt := AC_Counts.HasKey(key) ? AC_Counts[key] + 1 : 1
        AC_Counts[key] := cnt
    }

    ; запись с тем же ID, но другим ником - ID уже занял другой игрок, старая запись устарела
    i := AC_Queue.Length()
    while (i >= 1) {
        it := AC_Queue[i]
        if (it.id == id && it.nick != "" && nick != "" && it.nick != nick)
            AC_Queue.RemoveAt(i)
        i--
    }

    found := 0
    Loop, % AC_Queue.Length()
    {
        it := AC_Queue[A_Index]
        if ((nick != "" && it.nick = nick) || it.id == id) {
            found := A_Index
            break
        }
    }

    isNew := true
    if (found) {
        isNew := false
        it := AC_Queue[found]
        typeChanged := (it.type != type)
        it.id := id
        it.type := type
        it.count := cnt
        if (nick != "")
            it.nick := nick
        if (level != "")
            it.level := level
        if (reason != "" && !InStr(it.reason, reason))
            it.reason := (it.reason != "") ? it.reason . " | " . reason : reason
        if (StrLen(it.reason) > 220)
            it.reason := SubStr(it.reason, -219)
        if (typeChanged)
            isNew := true   ; сменился тип (например, AC -> Reconnect): сообщаем как о новой записи
    } else {
        AC_Queue.Push({id: id, nick: nick, level: level, type: type, reason: reason, count: cnt, t0: A_TickCount})
    }

    if (isNew) {
        nm := (nick != "") ? " (" . nick . ")" : ""
        xs := (cnt > 1) ? "  x" . cnt : ""
        if (type == "AC-Connect")
            addChatMessageEx(0x12A48B, "{9370DB}[Kasperr] {ffffff}Reconnect (переподключение) - " . id . nm . xs . "  |  В очереди: " . AC_Queue.Length() . " необработанных")
        else
            addChatMessageEx(0x12A48B, "{9370DB}[Kasperr] {ffffff}Походу опять чит - " . id . nm . xs . "  |  В очереди: " . AC_Queue.Length() . " необработанных")
    }
    ACQ_Refresh()
}

; Убирает цветовые коды и технические хвосты, оставляет суть причины
ACQ_CleanReason(r) {
    r := Trim(RegExReplace(r, "\{[0-9A-Fa-f]{1,6}\}"))
    if (RegExMatch(r, "^(.*?)\.?\s*Подробности:\s*(.*)$", m)) {
        cat := Trim(m1)
        det := Trim(m2)
        if (RegExMatch(cat, "^Невалидное поведение \((.+)\)$", k))
            return det . " (" . k1 . ")"
        return cat . ": " . det
    }
    r := RegExReplace(r, "\s*\(#\d+:\d+:\d+\)")
    r := RegExReplace(r, "\s*#\d+:\d+:\d+")
    r := RegExReplace(r, "\s*\(\d+\.\d+\)\s*$")
    r := RegExReplace(r, "\s*\(Ping: \d+\)")
    r := RegExReplace(r, "\s*\.\s*$")
    return Trim(r)
}

; ---------------------------------------------------------------------
;  Взять запись из очереди (общий код для Num5 / Num6 / окна)
; ---------------------------------------------------------------------
FindQueueIdx(type) {
    global AC_Queue
    for idx, item in AC_Queue {
        if (item.type == type)
            return idx
    }
    return -1
}

; Метка версии этого файла: видна при взятии игрока и в диагностике (Ctrl+Alt+F8)
ACQ_Version() {
    return "v20 launcher"
}

; Есть ли needle в text без учёта регистра (в AHK v1 для кириллицы InStr регистр различает: "Чит" != "чит")
ACQ_Has(text, needle) {
    StringLower, a, text
    StringLower, b, needle
    return (InStr(a, b) > 0)
}

; Дописывает строку в queue_debug.log рядом со скриптом (для разбора, если что-то не отписалось)
ACQ_Log(msg) {
    f := A_ScriptDir . "\queue_debug.log"
    FileGetSize, sz, %f%
    if (sz > 300000)
        FileDelete, %f%
    FormatTime, ts, , HH:mm:ss
    txt := ts . "  " . msg . "`n"
    FileAppend, %txt%, %f%, UTF-8
}

; Следит за чатом. Цель - игрок, которого ты взял из очереди (currentTarget) ИЛИ за которым ты в спеке
; и который есть в очереди античита (по строке "Вы начали следить за Ник [ID]" - как бы спек ни включили).
; Как только приходит строка про его кик / выход / наказание - пишет в /a:
;   [A] Ник [189] был кикнут (Verification error)   ->  "кикнут системой"
;   «AC» Ник [581] кикнут: ...                        ->  "кикнут античитом"
;   [A] Ник [362] был кикнут (Античит)                 ->  "кикнут античитом"
;   [A] Ник [311] был кикнут (Выдана блокировка)       ->  "наказан" (кик из-за блокировки)
;   [A] Ник [48] покинул игру                          ->  "вышел"
;   [A] Ник [311] покинул игру (краш/обрыв связи)      ->  "краш/обрыв связи"
;   Админ заблокировал (в оффлайне) игрока Ник на 30 дней. Причина: Чит  ->  "чит, наказан"
;   (блокировка с другой причиной запоминается: при кике "Выдана блокировка" пишем "наказан (причина)")
ACQ_WatchTarget(line) {
    global AC_Kicked, AC_Queue, currentTarget, currentTargetNick, currentTargetType, ACQ_BanReason
    global ACQ_SpecID, ACQ_SpecNick, ACQ_SpecType, ACQ_SpecTick, ACQ_TakeTick
    if (!IsObject(AC_Kicked))
        AC_Kicked := {}
    line := RegExReplace(line, "\{[0-9A-Fa-f]{1,6}\}")

    ; /re на несуществующего игрока (уже вышел): отписываем "вышел"
    if (InStr(line, "Такого игрока не существует")) {
        if (currentTarget && ACQ_TakeTick != "" && A_TickCount - ACQ_TakeTick < 15000) {
            ACQ_Log("игрока " . currentTarget . " не существует -> вышел")
            ACQ_ReportTarget("left", "", currentTarget + 0, currentTargetType, "take")
        }
        return
    }

    ; начали следить: запоминаем, если игрок есть в очереди античита
    if (RegExMatch(line, "Вы начали следить за (\S+) \[(\d+)\]", sp)) {
        sid := sp2 + 0
        if (currentTarget && currentTarget == sid)
            return
        idx := ACQ_IdxByID(sp2)
        if (idx) {
            ACQ_SpecID := sid
            ACQ_SpecNick := sp1
            ACQ_SpecType := AC_Queue[idx].type
            ACQ_SpecTick := A_TickCount
            ACQ_Log("спек за " . sp1 . " [" . sid . "] (есть в очереди) - слежу")
        } else {
            ACQ_SpecID := 0
        }
        return
    }

    ; текущая цель
    tid := 0
    tnick := ""
    ttype := ""
    src := ""
    if (currentTarget) {
        tid := currentTarget + 0
        tnick := currentTargetNick
        ttype := currentTargetType
        src := "take"
    } else if (ACQ_SpecID && A_TickCount - ACQ_SpecTick < 600000) {
        tid := ACQ_SpecID + 0
        tnick := ACQ_SpecNick
        ttype := ACQ_SpecType
        src := "spec"
    }

    ; наказание админом: [A] Админ заблокировал (в оффлайне) игрока Ник на 30 дней. Причина: Чит
    if (RegExMatch(line, "(?:заблокировал|забанил)а?\s+(?:в оффлайне\s+)?игрока\s+(\S+)(?:\s+\[\d+\])?\s+на\s.*?Причина:\s*(.*)$", b)) {
        ; у наказанного в этой строке может не быть ID - сравниваем по нику
        if (tid && tnick != "" && b1 = tnick) {
            if (ACQ_Has(b2, "чит")) {
                ACQ_Log("бан " . b1 . ": " . b2 . " -> чит, наказан (" . src . ")")
                ACQ_ReportTarget("ban", b2, tid, ttype, src)
            } else {
                ACQ_BanReason := Trim(b2)
                ACQ_Log("бан " . b1 . ": " . b2 . " (не чит) - запомнил причину")
            }
        } else {
            ACQ_Log("бан " . b1 . ": не наша цель (цель: " . tid . " " . tnick . ")")
        }
        return
    }

    kind := ""
    if (RegExMatch(line, "«AC»\s+(\S+)\s+\[(\d+)\]\s*кикнут:", k)) {
        kind := "ackick"
    } else if (RegExMatch(line, "(\S+)\s+\[(\d+)\]\s+был кикнут\s*\((.*)\)", k)) {
        if (ACQ_Has(k3, "блокиров"))
            kind := "ban"
        else if (ACQ_Has(k3, "античит"))
            kind := "ackick"
        else
            kind := "kick"
    } else if (RegExMatch(line, "(\S+)\s+\[(\d+)\]\s+покинул[а]?\s+игру", k)) {
        kind := InStr(line, "краш/обрыв связи") ? "crash" : "left"
    }
    if (kind == "")
        return
    id := k2 + 0
    if (kind == "kick" || kind == "ackick")
        AC_Kicked[id] := A_TickCount
    if (!tid || tid != id) {
        ACQ_Log(kind . " " . k1 . " [" . id . "]: не наша цель (цель: " . tid . " " . tnick . ")")
        return
    }
    ACQ_Log(kind . " " . k1 . " [" . id . "] -> отписываю (" . src . ")")
    ACQ_ReportTarget(kind, "", tid, ttype, src)
}

; Закрывает цель и отписывает причину в /a
ACQ_ReportTarget(kind, extra, tid, ttype, src) {
    global currentTarget, ACQ_BanReason, ACQ_SpecID
    prefix := (ttype == "AC-Connect") ? "/a [Reconnect] " : "/a "
    if (src == "take")
        currentTarget := 0
    if (ACQ_SpecID == tid)
        ACQ_SpecID := 0
    if (kind == "kick") {
        what := " кикнут системой"
    } else if (kind == "ackick") {
        what := " кикнут античитом"
    } else if (kind == "crash") {
        what := " краш/обрыв связи"
    } else if (kind == "ban") {
        reason := (extra != "") ? extra : ACQ_BanReason
        if (reason == "")
            what := " наказан"
        else if (ACQ_Has(reason, "чит"))
            what := " чит, наказан"
        else
            what := " наказан (" . reason . ")"
    } else {
        what := " вышел"
    }
    ACQ_BanReason := ""
    addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}" . tid . what . "  -> /a")
    ACQ_SendA(prefix . tid . what)
}

; --- Собственное чтение чат-лога (не зависит от главного монитора чата и версии main.ahk) ---
ACQ_EnsureReader() {
    global CHATLOG_PATH, ACQ_WatchPos
    if (ACQ_WatchPos != "")
        return
    f := FileOpen(CHATLOG_PATH, "r", "CP1251")
    if (!IsObject(f)) {
        ACQ_Log("не могу открыть чат-лог: " . CHATLOG_PATH)
        return
    }
    ACQ_WatchPos := f.Length
    f.Close()
    ACQ_Log("чтение чат-лога запущено, позиция " . ACQ_WatchPos)
    SetTimer, ACQ_ChatTick, 100
}

ACQ_WatchStart() {
    ACQ_EnsureReader()
}

ACQ_ReadChat() {
    global CHATLOG_PATH, ACQ_WatchPos, currentTarget
    static prevCT := 0
    if (prevCT && !currentTarget)
        ACQ_Log("цель " . prevCT . " закрыта (отписью выше или вручную Num5/Num6)")
    prevCT := currentTarget
    if (ACQ_WatchPos == "")
        return
    f := FileOpen(CHATLOG_PATH, "r", "CP1251")
    if (!IsObject(f))
        return
    size := f.Length
    if (size < ACQ_WatchPos)
        ACQ_WatchPos := 0
    content := ""
    if (size > ACQ_WatchPos) {
        f.Seek(ACQ_WatchPos)
        content := f.Read()
    }
    f.Close()
    if (content == "")
        return
    ; обрабатываем только полные строки; неполный хвост (без перевода строки) дочитаем в следующий раз
    parts := StrSplit(content, "`n")
    tail := ""
    if (SubStr(content, 0) != "`n")
        tail := parts.Pop()
    ACQ_WatchPos := size - StrLen(tail)
    for i, ln in parts {
        ln := RTrim(ln, "`r")
        if (ln != "")
            ACQ_WatchTarget(ln)
    }
}

; Отправка, когда открыт чат: запоминаем набранный текст, закрываем чат, шлём, открываем чат и возвращаем текст
ACQ_SendChatOpen(msg) {
    if (!AutoSAMP.checkHandles())
        return false
    ver := AutoSAMP.SAMP_VERSION
    saved := AutoSAMP.__READSTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CHATINPUT[ver]], 256)
    AutoSAMP.toggleChatInput(0)
    Sleep 100
    SendChat(msg)
    Sleep 150
    AutoSAMP.toggleChatInput(1)
    Sleep 100
    if (saved != "")
        AutoSAMP.__WRITESTRING(AutoSAMP.hGTA, AutoSAMP.dwSAMP, [SAMP_CHATINPUT[ver]], saved)
    return true
}

; Есть ли цель для быстрого ответа и закрыт ли чат (иначе цифры нумпада должны печататься как обычно)
ACQ_QuickOK() {
    global currentTarget, ACQ_SpecID, ACQ_SpecTick
    if (!currentTarget && !(ACQ_SpecID && A_TickCount - ACQ_SpecTick < 600000))
        return false
    return !AutoSAMP.isInChat()
}

; Быстрый ответ по цели: "/a ID текст", после чего цель закрывается
ACQ_QuickReply(text) {
    global currentTarget, currentTargetType, ACQ_SpecID, ACQ_SpecType, ACQ_SpecTick
    tid := 0
    ttype := ""
    src := ""
    if (currentTarget) {
        tid := currentTarget + 0
        ttype := currentTargetType
        src := "take"
    } else if (ACQ_SpecID && A_TickCount - ACQ_SpecTick < 600000) {
        tid := ACQ_SpecID + 0
        ttype := ACQ_SpecType
        src := "spec"
    }
    if (!tid) {
        addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Нет цели для ответа (возьми игрока из очереди)")
        return
    }
    prefix := (ttype == "AC-Connect") ? "/a [Reconnect] " : "/a "
    if (src == "take")
        currentTarget := 0
    if (ACQ_SpecID == tid)
        ACQ_SpecID := 0
    if (src == "spec") {
        RemoveACIDFromQueue(tid)
        ACQ_Refresh()
    }
    ACQ_Log("быстрый ответ " . tid . ": " . text . " (" . src . ")")
    addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}" . tid . " " . text . "  -> /a")
    ACQ_SendA(prefix . tid . " " . text)
}

; Очередь отправки в /a. Каждое сообщение - отдельный элемент, поэтому одно не может затереть другое.
; Между нашими /a выдерживается пауза 1 секунда (в логе сервер принимал /a именно с таким интервалом).
ACQ_SendA(msg) {
    global ACQ_SendQ
    if (msg == "")
        return
    if (!IsObject(ACQ_SendQ))
        ACQ_SendQ := []
    ACQ_SendQ.Push({text: msg, tries: 0})
    SetTimer, ACQ_SendPending, -50
}

; Был ли игрок кикнут системой незадолго до since (мс, A_TickCount)? Запись после проверки удаляется.
ACQ_WasKicked(id, since) {
    global AC_Kicked
    if (!IsObject(AC_Kicked))
        return false
    id += 0
    if (AC_Kicked.HasKey(id) && AC_Kicked[id] >= since - 5000) {
        AC_Kicked.Delete(id)
        return true
    }
    return false
}

TakeQueueEntry(idx) {
    global AC_Queue, currentTarget, currentTargetNick, currentTargetType, ACQ_LastA, ACQ_BanReason, ACQ_TakeTick
    ACQ_BanReason := ""
    ACQ_TakeTick := A_TickCount
    item := AC_Queue.RemoveAt(idx)
    target := item.id
    takeTick := A_TickCount
    prefix := (item.type == "AC-Connect") ? "/a [Reconnect] " : "/a "
    currentTarget := target
    currentTargetNick := item.nick
    currentTargetType := item.type
    ACQ_WatchStart()
    ACQ_Log("взят " . target . " (" . item.nick . ") тип " . item.type)
    SendChat(prefix . target . (item.type == "AC-Connect" ? " + " : " +"))
    ACQ_LastA := A_TickCount
    addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Слежу за " . target . " (" . item.nick . "): выход, кик, бан отпишу сам [QueueGui " . ACQ_Version() . "]")
    ACQ_Refresh()
    sleep 200
    SendChat("/re " . target)
    ; дальше цель закрывает только ACQ_WatchTarget по строкам чата (кик, выход, бан, "игрока не существует")
}

; ---------------------------------------------------------------------
;  Окно
; ---------------------------------------------------------------------
ACQ_Toggle() {
    global ACQ_Built, ACQ_Visible
    if (!ACQ_Built)
        ACQ_Build()
    if (ACQ_Visible)
        ACQ_Hide()
    else
        ACQ_Show()
}

ACQ_Build() {
    global ACQ_Built, ACQ_LV, ACQ_B1, ACQ_B2, ACQ_B3, ACQ_BPin, ACQ_BTrans, ACQ_PinSel, ACQ_AlphaS, ACQ_BF1, ACQ_BF2, ACQ_Status, ACQ_Hwnd, ACQ_Alpha, ACQ_Pin, ACQ_Trans, ACQ_T
    ACQ_LoadSettings()
    ACQ_LoadTheme()
    bg := ACQ_T.Bg
    panel := ACQ_T.Panel
    acc := ACQ_T.Accent
    txt := ACQ_T.Text
    pinIdx := ACQ_PinToIdx(ACQ_Pin)
    pinTxt := (ACQ_Pin == "") ? "Закрепить здесь" : "Открепить"
    trTxt := ACQ_Trans ? "Обычный фон" : "Прозрачный фон"
    btn := "h22 Center +0x200 Background" . acc . " cFFFFFF"
    ddl := "Background" . panel . " c" . txt
    if (ACQ_Trans) {
        Gui, ACQ:New, +AlwaysOnTop -Caption +ToolWindow +E0x08000000 +Resize +MinSize430x190 +HwndACQ_Hwnd, Очередь античита
        Gui, ACQ:Color, 010101
        lvOpt := "Background010101 cFFFFFF -Hdr -E0x200"
        stOpt := "BackgroundTrans cFFFFFF"
    } else {
        Gui, ACQ:New, +AlwaysOnTop +ToolWindow +E0x08000000 +Resize +MinSize480x200 +HwndACQ_Hwnd, Очередь античита
        Gui, ACQ:Color, %bg%, %panel%
        lvOpt := "NoSortHdr Background" . panel . " c" . txt
        stOpt := "BackgroundTrans c" . txt
    }
    Gui, ACQ:Default
    Gui, ACQ:Margin, 6, 6
    Gui, ACQ:Font, s8 q4, Segoe UI
    Gui, ACQ:Add, ListView, vACQ_LV gACQ_LVEvent r6 w500 -Multi %lvOpt%, Ник|ID|Ур.|Тип|Причина|x|Время
    Gui, ACQ:ListView, ACQ_LV
    Gui, ACQ:Add, Text, vACQ_B1 gACQ_BtnTake xm w62 %btn%, Взять
    Gui, ACQ:Add, Text, vACQ_B2 gACQ_BtnSpec x+4 w62 %btn%, Спек
    Gui, ACQ:Add, Text, vACQ_B3 gACQ_BtnSkip x+4 w62 %btn%, Скип
    if (ACQ_Trans) {
        ; ряд 2: закрепление, размер шрифта, "Открепить" и "Обычный фон" - рядом с A- / A+
        Gui, ACQ:Add, DropDownList, vACQ_PinSel gACQ_PinChange xm y+6 w112 r10 AltSubmit Choose%pinIdx% %ddl%, Не закреплено|Слева-сверху|По центру-сверху|Справа-сверху|Слева-по центру|Справа-по центру|Слева-снизу|По центру-снизу|Справа-снизу|Своё место
        Gui, ACQ:Add, Text, vACQ_BF1 gACQ_FontDown x+8 w26 %btn%, A-
        Gui, ACQ:Add, Text, vACQ_BF2 gACQ_FontUp x+4 w26 %btn%, A+
        Gui, ACQ:Add, Text, vACQ_BPin gACQ_BtnPin x+8 w100 %btn%, %pinTxt%
        Gui, ACQ:Add, Text, vACQ_BTrans gACQ_BtnTrans x+8 w100 %btn%, %trTxt%
        ; ряд 3: ползунок прозрачности и счётчик очереди (всегда видны)
        Gui, ACQ:Add, Slider, vACQ_AlphaS gACQ_AlphaChange xm y+6 w90 h22 Range60-255 NoTicks ToolTip BackgroundTrans, %ACQ_Alpha%
        Gui, ACQ:Add, Text, vACQ_Status x+10 yp+4 w300 %stOpt%, В очереди: 0
    } else {
        Gui, ACQ:Add, Text, vACQ_BPin gACQ_BtnPin x+8 w100 %btn%, %pinTxt%
        Gui, ACQ:Add, Text, vACQ_BTrans gACQ_BtnTrans x+8 w100 %btn%, %trTxt%
        Gui, ACQ:Add, DropDownList, vACQ_PinSel gACQ_PinChange xm y+6 w112 r10 AltSubmit Choose%pinIdx% %ddl%, Не закреплено|Слева-сверху|По центру-сверху|Справа-сверху|Слева-по центру|Справа-по центру|Слева-снизу|По центру-снизу|Справа-снизу|Своё место
        Gui, ACQ:Add, Slider, vACQ_AlphaS gACQ_AlphaChange x+8 w90 h22 Range60-255 NoTicks ToolTip BackgroundTrans, %ACQ_Alpha%
        Gui, ACQ:Add, Text, vACQ_BF1 gACQ_FontDown x+8 w26 %btn%, A-
        Gui, ACQ:Add, Text, vACQ_BF2 gACQ_FontUp x+4 w26 %btn%, A+
        Gui, ACQ:Add, Text, vACQ_Status x+12 yp+4 w190 %stOpt%, В очереди: 0
    }
    OnMessage(0x201, "ACQ_OnLButton")
    ACQ_Built := true
    ACQ_ApplyFont()
    if (!ACQ_Trans)
        ACQ_ThemeWindow()
}

; Тёмный заголовок окна и тёмный ListView (по возможности; на старых Windows просто не сработает)
ACQ_ThemeWindow() {
    global ACQ_Hwnd, ACQ_LV
    Gui, ACQ:Default
    ACQ_DarkTitle(ACQ_Hwnd)
    GuiControlGet, hLV, Hwnd, ACQ_LV
    ACQ_DarkListView(hLV)
}

; Слежение за положением окна: если сдвинули - запоминаем (чтобы место сохранялось)
ACQ_CheckPos() {
    global ACQ_Visible, ACQ_Pin, ACQ_PosX, ACQ_PosY, ACQ_Hwnd
    if (!ACQ_Visible || ACQ_Pin != "")
        return
    WinGetPos, wx, wy, , , ahk_id %ACQ_Hwnd%
    if (wx == "" || wx < -30000)
        return
    if (wx != ACQ_PosX || wy != ACQ_PosY) {
        ACQ_PosX := wx
        ACQ_PosY := wy
        SetTimer, ACQ_SaveLater, -1500
    }
}

; Размер шрифта списка + ширины колонок под него
ACQ_ApplyFont() {
    global ACQ_FontSize, ACQ_LV, ACQ_Trans, ACQ_Status, ACQ_T
    ; прозрачный режим - белый текст; обычный - цвет темы
    if (ACQ_Trans)
        col := "FFFFFF"
    else
        col := ACQ_T.Text
    Gui, ACQ:Default
    Gui, ACQ:ListView, ACQ_LV
    Gui, ACQ:Font, s%ACQ_FontSize% q4 c%col%, Segoe UI
    GuiControl, ACQ:Font, ACQ_LV
    GuiControl, ACQ:Font, ACQ_Status
    ACQ_FitColumns()
}

; Ставит сохранённую ширину колонок (сами ничего не пересчитываем - ширину выставляет пользователь)
ACQ_FitColumns(lvW := "") {
    global ACQ_ColW, ACQ_LV
    if (!IsObject(ACQ_ColW))
        return
    Gui, ACQ:Default
    Gui, ACQ:ListView, ACQ_LV
    Loop, 7
        LV_ModifyCol(A_Index, ACQ_ColW[A_Index])
}

; Если пользователь потянул границу колонки в заголовке - запоминаем новую ширину
ACQ_CheckColWidths() {
    global ACQ_ColW, ACQ_LV, ACQ_Trans, ACQ_Visible
    if (!ACQ_Visible || ACQ_Trans || !IsObject(ACQ_ColW))
        return
    Gui, ACQ:Default
    GuiControlGet, hLV, Hwnd, ACQ_LV
    changed := false
    Loop, 7
    {
        col := A_Index - 1
        SendMessage, 0x101D, %col%, 0, , ahk_id %hLV%
        w := ErrorLevel
        if (w != "FAIL" && w != ACQ_ColW[A_Index]) {
            ACQ_ColW[A_Index] := w
            changed := true
        }
    }
    if (changed)
        SetTimer, ACQ_SaveLater, -1500
}

ACQ_Show() {
    global ACQ_Visible, ACQ_PosX, ACQ_PosY, ACQ_CW, ACQ_CH, ACQ_Pin, ACQ_Trans, ACQ_CtlShown, ACQ_LeaveTick
    opts := ""
    if (ACQ_CW != "" && ACQ_CH != "")
        opts .= " w" . ACQ_CW . " h" . ACQ_CH
    if (ACQ_PosX == "" || ACQ_PosX < -300 || ACQ_PosY < -50 || ACQ_PosX >= A_ScreenWidth - 40 || ACQ_PosY >= A_ScreenHeight - 40) {
        ACQ_PosX := 20
        ACQ_PosY := 350
    }
    opts .= " x" . ACQ_PosX . " y" . ACQ_PosY
    Gui, ACQ:Show, %opts% NoActivate
    ACQ_Visible := true
    ACQ_ApplyAlpha()
    ACQ_Refresh(true)
    ACQ_Snap()
    SetTimer, ACQ_Tick, 500
    if (ACQ_Trans) {
        ACQ_CtlShown := true
        ACQ_LeaveTick := A_TickCount
        SetTimer, ACQ_HoverTick, 150
    }
}

ACQ_Hide() {
    global ACQ_Visible, ACQ_PosX, ACQ_PosY, ACQ_Hwnd, ACQ_Pin
    if (ACQ_Pin == "") {
        WinGetPos, wx, wy, , , ahk_id %ACQ_Hwnd%
        if (wx != "") {
            ACQ_PosX := wx
            ACQ_PosY := wy
        }
    }
    Gui, ACQ:Hide
    ACQ_Visible := false
    SetTimer, ACQ_Tick, Off
    SetTimer, ACQ_HoverTick, Off
    ACQ_SaveSettings()
}

; ---------------------------------------------------------------------
;  Прозрачность, закрепление, сохранение настроек
; ---------------------------------------------------------------------
ACQ_ApplyAlpha() {
    global ACQ_Alpha, ACQ_Hwnd, ACQ_Trans
    if (ACQ_Trans)
        WinSet, TransColor, 010101 %ACQ_Alpha%, ahk_id %ACQ_Hwnd%
    else if (ACQ_Alpha >= 255)
        WinSet, Transparent, Off, ahk_id %ACQ_Hwnd%
    else
        WinSet, Transparent, %ACQ_Alpha%, ahk_id %ACQ_Hwnd%
}

ACQ_PinToIdx(code) {
    codes := ["", "TL", "TC", "TR", "ML", "MR", "BL", "BC", "BR", "XY"]
    for i, c in codes {
        if (c == code)
            return i
    }
    return 1
}

ACQ_IdxToPin(idx) {
    codes := ["", "TL", "TC", "TR", "ML", "MR", "BL", "BC", "BR", "XY"]
    return codes[idx]
}

; Прижимает окно к выбранной точке экрана (или окна игры, если оно есть и не свёрнуто)
ACQ_Snap() {
    global ACQ_Pin, ACQ_Visible, ACQ_Hwnd, ACQ_PinX, ACQ_PinY
    if (ACQ_Pin == "" || !ACQ_Visible)
        return
    if (ACQ_Pin == "XY") {
        ACQ_SnapTo(ACQ_PinX, ACQ_PinY)
        return
    }
    rx := 0
    ry := 0
    rw := A_ScreenWidth
    rh := A_ScreenHeight
    if (WinExist("AMAZING ONLINE")) {
        WinGet, mm, MinMax, AMAZING ONLINE
        WinGetPos, gx, gy, gw, gh, AMAZING ONLINE
        if (mm != -1 && gw > 200 && gh > 200) {
            rx := gx
            ry := gy
            rw := gw
            rh := gh
        }
    }
    WinGetPos, wx, wy, ww, wh, ahk_id %ACQ_Hwnd%
    if (wx == "")
        return
    v := SubStr(ACQ_Pin, 1, 1)
    h := SubStr(ACQ_Pin, 2, 1)
    m := 10
    nx := (h == "L") ? rx + m : (h == "R") ? rx + rw - ww - m : rx + (rw - ww) // 2
    ny := (v == "T") ? ry + m : (v == "B") ? ry + rh - wh - m : ry + (rh - wh) // 2
    if (nx != wx || ny != wy)
        WinMove, ahk_id %ACQ_Hwnd%, , %nx%, %ny%
}

; Двигает окно в точку x,y (если вне экрана - в запасное место)
ACQ_SnapTo(x, y) {
    global ACQ_Hwnd
    if (x == "" || y == "" || x < -300 || y < -50 || x >= A_ScreenWidth - 40 || y >= A_ScreenHeight - 40) {
        x := 20
        y := 350
    }
    WinGetPos, wx, wy, , , ahk_id %ACQ_Hwnd%
    if (wx == "")
        return
    if (wx != x || wy != y)
        WinMove, ahk_id %ACQ_Hwnd%, , %x%, %y%
}

; Закрепить окно ровно там, где оно стоит сейчас
ACQ_PinHere() {
    global ACQ_Pin, ACQ_PinX, ACQ_PinY, ACQ_Hwnd
    WinGetPos, wx, wy, , , ahk_id %ACQ_Hwnd%
    if (wx == "")
        return
    ACQ_PinX := wx
    ACQ_PinY := wy
    ACQ_Pin := "XY"
    ACQ_SyncPinUI()
    ACQ_SaveSettings()
}

; Снять закрепление (окно можно двигать свободно)
ACQ_Unpin() {
    global ACQ_Pin, ACQ_PosX, ACQ_PosY, ACQ_Hwnd
    ACQ_Pin := ""
    WinGetPos, wx, wy, , , ahk_id %ACQ_Hwnd%
    if (wx != "") {
        ACQ_PosX := wx
        ACQ_PosY := wy
    }
    ACQ_SyncPinUI()
    ACQ_SaveSettings()
}

; Подпись кнопки и выбранный пункт списка - по текущему закреплению
ACQ_SyncPinUI() {
    global ACQ_Pin
    Gui, ACQ:Default
    GuiControl, ACQ:, ACQ_BPin, % (ACQ_Pin == "") ? "Закрепить здесь" : "Открепить"
    GuiControl, ACQ:Choose, ACQ_PinSel, % ACQ_PinToIdx(ACQ_Pin)
}

; Переключить режим "прозрачный фон" (окно пересоздаётся)
ACQ_ToggleTrans() {
    global ACQ_Trans, ACQ_Built, ACQ_Visible, ACQ_Pin, ACQ_PosX, ACQ_PosY, ACQ_Hwnd, ACQ_Sig, ACQ_LastTitle, ACQ_CW, ACQ_CH
    if (!ACQ_Built)
        ACQ_LoadSettings()
    wasVisible := ACQ_Visible
    if (ACQ_Built) {
        if (wasVisible && ACQ_Pin == "") {
            WinGetPos, wx, wy, , , ahk_id %ACQ_Hwnd%
            if (wx != "") {
                ACQ_PosX := wx
                ACQ_PosY := wy
            }
        }
        SetTimer, ACQ_Tick, Off
        SetTimer, ACQ_HoverTick, Off
        Gui, ACQ:Destroy
    }
    ACQ_SaveSettings()
    ACQ_Trans := ACQ_Trans ? 0 : 1
    ACQ_CW := ""
    ACQ_CH := ""
    ACQ_SaveSettings()
    ACQ_Built := false
    ACQ_Visible := false
    ACQ_Sig := ""
    ACQ_LastTitle := ""
    if (wasVisible) {
        ACQ_Build()
        ACQ_Show()
    }
}

; Прячет / показывает кнопки в прозрачном режиме
ACQ_ShowCtl(show) {
    global ACQ_CtlShown
    Gui, ACQ:Default
    names := "ACQ_B1,ACQ_B2,ACQ_B3,ACQ_BPin,ACQ_BTrans,ACQ_PinSel,ACQ_BF1,ACQ_BF2"
    Loop, Parse, names, `,
    {
        if (show)
            GuiControl, ACQ:Show, %A_LoopField%
        else
            GuiControl, ACQ:Hide, %A_LoopField%
    }
    ACQ_CtlShown := show
}

; Кнопки видны, пока курсор над окном (проверяем по координатам - прозрачные места пропускают мышь)
ACQ_UpdateHover() {
    global ACQ_Trans, ACQ_Visible, ACQ_Hwnd, ACQ_CtlShown, ACQ_LeaveTick
    if (!ACQ_Trans || !ACQ_Visible)
        return
    CoordMode, Mouse, Screen
    MouseGetPos, mx, my
    WinGetPos, wx, wy, ww, wh, ahk_id %ACQ_Hwnd%
    if (wx == "")
        return
    inside := (mx >= wx && mx < wx + ww && my >= wy && my < wy + wh)
    if (!inside) {
        Gui, ACQ:Default
        GuiControlGet, ddl, Hwnd, ACQ_PinSel
        SendMessage, 0x157, 0, 0, , ahk_id %ddl%
        if (ErrorLevel == 1)
            inside := true
    }
    if (inside) {
        ACQ_LeaveTick := A_TickCount
        if (!ACQ_CtlShown)
            ACQ_ShowCtl(true)
    } else if (ACQ_CtlShown && A_TickCount - ACQ_LeaveTick > 700) {
        ACQ_ShowCtl(false)
    }
}

; Ctrl + левая кнопка по окну (в прозрачном режиме без заголовка) - перетащить окно
ACQ_OnLButton(wParam, lParam, msg, hwnd) {
    global ACQ_Hwnd, ACQ_Pin, ACQ_Trans
    if (!ACQ_Hwnd || !ACQ_Trans || ACQ_Pin != "")
        return
    if (!GetKeyState("Ctrl", "P"))
        return
    if (DllCall("GetAncestor", "Ptr", hwnd, "UInt", 2, "Ptr") != ACQ_Hwnd)
        return
    PostMessage, 0xA1, 2, , , ahk_id %ACQ_Hwnd%
    return 0
}

ACQ_LoadSettings() {
    global ACQ_Alpha, ACQ_Pin, ACQ_PosX, ACQ_PosY, ACQ_CW, ACQ_CH, ACQ_FontSize, ACQ_PinX, ACQ_PinY, ACQ_Trans, ACQ_ColW
    f := A_ScriptDir . "\queue_window.ini"
    IniRead, tb, %f%, queue, TransBg, 1
    ACQ_Trans := (tb + 0) ? 1 : 0
    defW := [115, 36, 28, 30, 260, 28, 40]
    ACQ_ColW := []
    Loop, 7
    {
        IniRead, cwv, %f%, queue, ColW%A_Index%, % defW[A_Index]
        cwv := cwv + 0
        if (cwv < 0 || cwv > 1500)
            cwv := defW[A_Index]
        ACQ_ColW.Push(cwv)
    }
    IniRead, px, %f%, queue, PinX, NONE
    IniRead, py, %f%, queue, PinY, NONE
    if (px != "NONE" && py != "NONE") {
        ACQ_PinX := px + 0
        ACQ_PinY := py + 0
    }
    IniRead, a, %f%, queue, Alpha, 255
    IniRead, p, %f%, queue, Pin, FREE
    IniRead, x, %f%, queue, X, NONE
    IniRead, y, %f%, queue, Y, NONE
    wk := ACQ_Trans ? "TW" : "W"
    hk := ACQ_Trans ? "TH" : "H"
    IniRead, cw, %f%, queue, %wk%, NONE
    IniRead, ch, %f%, queue, %hk%, NONE
    ACQ_CW := ""
    ACQ_CH := ""
    IniRead, fs, %f%, queue, FontSize, 8
    ACQ_FontSize := Max(7, Min(16, fs + 0))
    ACQ_Alpha := Max(60, Min(255, a + 0))
    ACQ_Pin := (p == "FREE") ? "" : p
    if (ACQ_PinToIdx(ACQ_Pin) == 1 || (ACQ_Pin == "XY" && ACQ_PinX == ""))
        ACQ_Pin := ""
    if (x != "NONE" && y != "NONE") {
        ACQ_PosX := x + 0
        ACQ_PosY := y + 0
    }
    if (cw != "NONE" && ch != "NONE") {
        ACQ_CW := cw + 0
        ACQ_CH := ch + 0
    }
}

ACQ_SaveSettings() {
    global ACQ_Alpha, ACQ_Pin, ACQ_PosX, ACQ_PosY, ACQ_CW, ACQ_CH, ACQ_FontSize, ACQ_PinX, ACQ_PinY, ACQ_Trans, ACQ_ColW
    f := A_ScriptDir . "\queue_window.ini"
    pinTxt := (ACQ_Pin == "") ? "FREE" : ACQ_Pin
    IniWrite, %ACQ_Alpha%, %f%, queue, Alpha
    IniWrite, %pinTxt%, %f%, queue, Pin
    IniWrite, %ACQ_Trans%, %f%, queue, TransBg
    if (IsObject(ACQ_ColW)) {
        Loop, % ACQ_ColW.Length()
            IniWrite, % ACQ_ColW[A_Index], %f%, queue, ColW%A_Index%
    }
    if (ACQ_PinX != "") {
        IniWrite, %ACQ_PinX%, %f%, queue, PinX
        IniWrite, %ACQ_PinY%, %f%, queue, PinY
    }
    IniWrite, %ACQ_FontSize%, %f%, queue, FontSize
    if (ACQ_PosX != "") {
        IniWrite, %ACQ_PosX%, %f%, queue, X
        IniWrite, %ACQ_PosY%, %f%, queue, Y
    }
    if (ACQ_CW != "") {
        wk := ACQ_Trans ? "TW" : "W"
        hk := ACQ_Trans ? "TH" : "H"
        IniWrite, %ACQ_CW%, %f%, queue, %wk%
        IniWrite, %ACQ_CH%, %f%, queue, %hk%
    }
}

ACQ_Age(t0) {
    s := (A_TickCount - t0) // 1000
    return Format("{:d}:{:02d}", s // 60, Mod(s, 60))
}

ACQ_Refresh(force := false) {
    global AC_Queue, ACQ_Visible, ACQ_Sig, ACQ_LV, ACQ_Hwnd, ACQ_LastTitle, ACQ_Trans
    if (!ACQ_Visible)
        return
    Gui, ACQ:Default
    Gui, ACQ:ListView, ACQ_LV
    sig := ""
    nAC := 0
    nRE := 0
    for i, it in AC_Queue {
        sig .= it.id . "|" . it.nick . "|" . it.level . "|" . it.type . "|" . it.reason . "|" . it.count . "`n"
        if (it.type == "AC-Connect")
            nRE++
        else
            nAC++
    }
    if (force || sig != ACQ_Sig) {
        selID := ACQ_SelectedID()
        GuiControl, ACQ:-Redraw, ACQ_LV
        LV_Delete()
        for i, it in AC_Queue
            LV_Add("", it.nick, it.id, it.level, (it.type == "AC-Connect") ? "RE" : "AC", it.reason, (it.count > 1) ? "x" . it.count : "", ACQ_Age(it.t0))
        if (selID != "") {
            Loop, % LV_GetCount()
            {
                LV_GetText(t, A_Index, 2)
                if (t == selID) {
                    LV_Modify(A_Index, "Select Focus")
                    break
                }
            }
        }
        GuiControl, ACQ:+Redraw, ACQ_LV
        ACQ_Sig := sig
    } else {
        Loop, % LV_GetCount()
            LV_Modify(A_Index, "Col7", ACQ_Age(AC_Queue[A_Index].t0))
    }
    title := "Очередь античита: " . AC_Queue.Length() . " (AC " . nAC . ", RE " . nRE . ")"
    if (title != ACQ_LastTitle) {
        WinSetTitle, ahk_id %ACQ_Hwnd%, , %title%
        ACQ_LastTitle := title
        stTxt := "В очереди: " . AC_Queue.Length() . "  (AC " . nAC . ", RE " . nRE . ")"
        GuiControl, ACQ:, ACQ_Status, %stTxt%
    }
}

ACQ_SelectedID() {
    global ACQ_LV
    Gui, ACQ:Default
    Gui, ACQ:ListView, ACQ_LV
    row := LV_GetNext(0)
    if (!row)
        return ""
    LV_GetText(v, row, 2)
    return v
}

ACQ_IdxByID(id) {
    global AC_Queue
    for idx, it in AC_Queue {
        if (it.id == id)
            return idx
    }
    return 0
}

ACQ_Hint(txt) {
    ToolTip, %txt%
    SetTimer, ACQ_TipOff, -1500
}

ACQ_DoTake(id) {
    global AC_Queue, currentTarget
    if (currentTarget) {
        addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Сначала закрой текущую цель (Num5/Num6): " . currentTarget)
        return
    }
    if (id == "") {
        if (AC_Queue.Length() == 0)
            return
        id := AC_Queue[1].id
    }
    idx := ACQ_IdxByID(id)
    if (idx)
        TakeQueueEntry(idx)
}

; ---------------------------------------------------------------------
;  Обработчики окна
; ---------------------------------------------------------------------
ACQ_LVEvent:
    if (A_GuiEvent = "DoubleClick") {
        Gui, ACQ:Default
        Gui, ACQ:ListView, ACQ_LV
        LV_GetText(dcID, A_EventInfo, 2)
        if (dcID != "")
            ACQ_DoTake(dcID)
    }
    return

ACQ_BtnTake:
    ACQ_DoTake(ACQ_SelectedID())
    return

ACQ_BtnSpec:
    spID := ACQ_SelectedID()
    if (spID == "")
        ACQ_Hint("Выбери строку")
    else
        SendChat("/re " . spID)
    return

ACQ_BtnSkip:
    skID := ACQ_SelectedID()
    if (skID == "") {
        ACQ_Hint("Выбери строку")
    } else {
        RemoveACIDFromQueue(skID)
        ACQ_Refresh()
    }
    return

ACQ_Tick:
    ACQ_Refresh()
    ACQ_Snap()
    ACQ_CheckColWidths()
    ACQ_CheckPos()
    return

ACQ_HoverTick:
    ACQ_UpdateHover()
    return

ACQ_ChatTick:
    ACQ_ReadChat()
    return

ACQ_SendPending:
    if (!IsObject(ACQ_SendQ) || ACQ_SendQ.Length() == 0)
        return
    if (ACQ_LastA != "" && A_TickCount - ACQ_LastA < 1000) {
        SetTimer, ACQ_SendPending, % -(1000 - (A_TickCount - ACQ_LastA) + 20)
        return
    }
    sendItem := ACQ_SendQ.RemoveAt(1)
    sendMsg := sendItem.text
    if (sendMsg != "") {
        if (AutoSAMP.isInChat()) {
            ACQ_Log("чат открыт - отправляю с закрытием чата: " . sendMsg)
            ACQ_SendChatOpen(sendMsg)
        } else if (SendChat(sendMsg) == -1 && sendItem.tries < 3) {
            sendItem.tries += 1
            ACQ_SendQ.InsertAt(1, sendItem)
            SetTimer, ACQ_SendPending, -600
            return
        }
        ACQ_Log("отправлено: " . sendMsg)
        ACQ_LastA := A_TickCount
    }
    if (ACQ_SendQ.Length() > 0)
        SetTimer, ACQ_SendPending, -1020
    return

ACQ_BtnTrans:
    ACQ_ToggleTrans()
    return

ACQ_PinChange:
    Gui, ACQ:Default
    GuiControlGet, pcIdx, , ACQ_PinSel
    if (pcIdx == 10) {
        ACQ_PinHere()
    } else if (pcIdx == 1) {
        ACQ_Unpin()
    } else {
        ACQ_Pin := ACQ_IdxToPin(pcIdx)
        ACQ_Snap()
        ACQ_SyncPinUI()
        ACQ_SaveSettings()
    }
    return

ACQ_BtnPin:
    if (ACQ_Pin == "")
        ACQ_PinHere()
    else
        ACQ_Unpin()
    return

ACQ_AlphaChange:
    Gui, ACQ:Default
    GuiControlGet, ACQ_Alpha, , ACQ_AlphaS
    ACQ_ApplyAlpha()
    SetTimer, ACQ_SaveLater, -1500
    return

ACQ_SaveLater:
    ACQ_SaveSettings()
    return

ACQ_FontDown:
    if (ACQ_FontSize > 7) {
        ACQ_FontSize -= 1
        ACQ_ApplyFont()
        SetTimer, ACQ_SaveLater, -1500
    }
    return

ACQ_FontUp:
    if (ACQ_FontSize < 16) {
        ACQ_FontSize += 1
        ACQ_ApplyFont()
        SetTimer, ACQ_SaveLater, -1500
    }
    return

ACQGuiSize:
    if (A_EventInfo = 1)
        return
    ACQ_CW := A_GuiWidth
    ACQ_CH := A_GuiHeight
    lvW := A_GuiWidth - 12
    if (ACQ_Trans) {
        lvH := A_GuiHeight - 94
        rowA := A_GuiHeight - 86
        rowB := A_GuiHeight - 58
        rowC := A_GuiHeight - 30
        rowCt := A_GuiHeight - 26
        GuiControl, ACQ:Move, ACQ_LV, w%lvW% h%lvH%
        GuiControl, ACQ:Move, ACQ_B1, y%rowA%
        GuiControl, ACQ:Move, ACQ_B2, y%rowA%
        GuiControl, ACQ:Move, ACQ_B3, y%rowA%
        GuiControl, ACQ:Move, ACQ_PinSel, y%rowB%
        GuiControl, ACQ:Move, ACQ_BF1, y%rowB%
        GuiControl, ACQ:Move, ACQ_BF2, y%rowB%
        GuiControl, ACQ:Move, ACQ_BPin, y%rowB%
        GuiControl, ACQ:Move, ACQ_BTrans, y%rowB%
        GuiControl, ACQ:Move, ACQ_AlphaS, y%rowC%
        GuiControl, ACQ:Move, ACQ_Status, y%rowCt%
    } else {
        lvH := A_GuiHeight - 66
        rowA := A_GuiHeight - 58
        rowB := A_GuiHeight - 30
        GuiControl, ACQ:Move, ACQ_LV, w%lvW% h%lvH%
        GuiControl, ACQ:Move, ACQ_B1, y%rowA%
        GuiControl, ACQ:Move, ACQ_B2, y%rowA%
        GuiControl, ACQ:Move, ACQ_B3, y%rowA%
        GuiControl, ACQ:Move, ACQ_BPin, y%rowA%
        GuiControl, ACQ:Move, ACQ_BTrans, y%rowA%
        GuiControl, ACQ:Move, ACQ_PinSel, y%rowB%
        GuiControl, ACQ:Move, ACQ_AlphaS, y%rowB%
        GuiControl, ACQ:Move, ACQ_BF1, y%rowB%
        GuiControl, ACQ:Move, ACQ_BF2, y%rowB%
        rowBt := A_GuiHeight - 26
        GuiControl, ACQ:Move, ACQ_Status, y%rowBt%
    }
    ACQ_FitColumns(lvW)
    ACQ_Snap()
    SetTimer, ACQ_SaveLater, -1500
    return

ACQ_TipOff:
    ToolTip
    return

ACQGuiClose:
ACQGuiEscape:
    ACQ_Hide()
    return

; ---- подключаемые модули (только функции, метки и хоткеи; ставить в самом конце) ----
#Include Theme.ahk
#Include MiniWin.ahk
