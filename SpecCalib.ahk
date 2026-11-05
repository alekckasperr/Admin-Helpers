; =====================================================================
;  SpecCalib.ahk - поиск "ID игрока в спеке" после обновления игры
;
;  Подключается В САМОМ КОНЦЕ main.ahk (здесь есть хоткеи, поэтому
;  выше по файлу нельзя - они прервут автозапуск скрипта).
;
;  Ctrl+Alt+F8 - диагностика: что скрипт видит и читает сейчас
;  Ctrl+Alt+F9 - калибровка: 2-3 раза, каждый раз при /re за ДРУГИМ игроком
;
;  Скрипт только ЧИТАЕТ память игры (секции aggmain.asi, доступные
;  для записи), ищет число = введённому ID и оставляет только то
;  смещение, которое каждый раз совпадало. Результат: offsets.ini.
; =====================================================================
global SC_Cands, SC_LastID, SC_Pass

^!F8::
    SC_Diag()
    return

^!F9::
    SC_Step()
    return

SC_Diag() {
    global hGTA, dwAGG, dwSAMP, SPEC_ID_OFFSET
    checkHandles()
    if (!hGTA) {
        MsgBox, 48, Диагностика, Окно "AMAZING ONLINE" не найдено (или нет прав - запусти скрипт от администратора).
        return
    }
    txt := "aggmain.asi: " . (dwAGG ? Format("0x{:X}", dwAGG) : "НЕ НАЙДЕН")
    txt .= "`nazmp.dll: " . (dwSAMP ? Format("0x{:X}", dwSAMP) : "НЕ НАЙДЕН")
    if (!dwAGG) {
        txt .= "`n`nПодходящие модули в игре:`n" . SC_Modules()
        txt .= "`nЕсли aggmain.asi переименован - поменяй GAME_MP_ModuleAggmain в Sp.ahk."
    } else {
        txt .= "`nСмещение ID спека: " . Format("0x{:X}", SPEC_ID_OFFSET)
        txt .= "`nСейчас читается: " . getSpID()
        txt .= "`nОткалибровано под эту версию игры: " . (SpecIdTrusted() ? "да" : "НЕТ -> Ctrl+Alt+F9")
    }
    MsgBox, 64, Диагностика, %txt%
}

SC_Modules() {
    global hGTA
    out := ""
    cb := 0
    VarSetCapacity(hMods, 8192, 0)
    if (!DllCall("Psapi.dll\EnumProcessModules", "Ptr", hGTA, "Ptr", &hMods, "UInt", 8192, "UIntP", cb))
        return "(список модулей недоступен)`n"
    VarSetCapacity(nm, 520, 0)
    Loop, % cb // A_PtrSize
    {
        hm := NumGet(hMods, (A_Index - 1) * A_PtrSize, "Ptr")
        DllCall("Psapi.dll\GetModuleFileNameEx", "Ptr", hGTA, "Ptr", hm, "Str", nm, "UInt", 260)
        SplitPath, nm, fn
        if (RegExMatch(fn, "i)\.asi$|agg|azmp|samp|amazing"))
            out .= "  " . fn . "`n"
    }
    return out
}

SC_Step() {
    global SC_Cands, SC_LastID, SC_Pass
    if (!checkHandles()) {
        MsgBox, 48, Калибровка, Не вижу игру или модуль aggmain.asi.`nСмотри Ctrl+Alt+F8.
        return
    }
    if (IsObject(SC_Cands))
        prompt := "Осталось вариантов: " . SC_Cands.Length() . "`n`nВключи /re за ДРУГИМ игроком и введи его ID.`n(r - начать заново)"
    else
        prompt := "Шаг 1.`n`nВключи слежку (/re) за любым игроком и введи его ID.`n(r - начать заново)"
    InputBox, sid, Калибровка ID спека, %prompt%, , 420, 220
    if (ErrorLevel)
        return
    sid := Trim(sid)
    if (sid = "r" || sid = "к") {
        SC_Cands := ""
        SC_LastID := ""
        SC_Pass := 0
        ToolTip, Калибровка сброшена
        SetTimer, SC_TipOff, -1500
        return
    }
    if sid is not integer
    {
        MsgBox, 48, Калибровка, Нужно число - ID игрока, за которым ты сейчас следишь.
        return
    }
    sid += 0
    if (sid < 1 || sid > 999) {
        MsgBox, 48, Калибровка, Возьми игрока с ID от 1 до 999 (ID 0 слишком часто встречается в памяти).
        return
    }
    if (IsObject(SC_Cands) && sid = SC_LastID) {
        MsgBox, 48, Калибровка, Нужен ДРУГОЙ игрок: тот же ID поиск не сузит.
        return
    }

    ToolTip, Сканирую память игры...
    found := SC_Scan(sid)
    ToolTip
    if (!IsObject(found))
        return

    if (!IsObject(SC_Cands)) {
        arr := []
        for off in found
            arr.Push(off)
        SC_Cands := arr
        SC_Pass := 1
    } else {
        keep := []
        for i, off in SC_Cands
            if (found.HasKey(off))
                keep.Push(off)
        SC_Cands := keep
        SC_Pass += 1
    }
    SC_LastID := sid
    n := SC_Cands.Length()

    if (n = 0) {
        SC_Cands := ""
        SC_LastID := ""
        SC_Pass := 0
        MsgBox, 48, Калибровка, Ничего не нашлось. Проверь, что ID введён верно и ты именно в слежке (/re).`nЕсли так и останется - ID, видимо, хранится иначе (не как 4-байтное число): тогда Alt+2/3/4 будут брать ID из Num5/Num6 или спрашивать.`n`nПоиск сброшен, можно начать заново.
    } else if (n = 1 || SC_Pass >= 4) {
        off := SC_Cands[1]
        SC_Save(off)
        SC_Cands := ""
        SC_LastID := ""
        SC_Pass := 0
        MsgBox, 64, Калибровка, % "Готово! Смещение " . Format("0x{:X}", off) . " сохранено в offsets.ini.`nПроверь: Ctrl+Alt+F8."
    } else {
        MsgBox, 64, Калибровка, Подходящих вариантов пока: %n%.`nВключи /re за ЕЩЁ ОДНИМ игроком и снова нажми Ctrl+Alt+F9.
    }
}

SC_TipOff:
    ToolTip
    return

; Ищет DWORD == id в секциях aggmain.asi, доступных для записи.
; Возвращает объект {смещение_от_базы_модуля: 1, ...} или "" при ошибке.
SC_Scan(id) {
    global hGTA, dwAGG
    peOff := readDWORD(hGTA, dwAGG + 0x3C)
    if (peOff < 0x40 || peOff > 0x1000 || readMem(hGTA, dwAGG + peOff, 4, "UInt") != 0x4550) {
        MsgBox, 16, Калибровка, Не удалось прочитать заголовок aggmain.asi.
        return ""
    }
    nSec    := readMem(hGTA, dwAGG + peOff + 6, 2, "UShort")
    optSize := readMem(hGTA, dwAGG + peOff + 20, 2, "UShort")
    secTab  := dwAGG + peOff + 24 + optSize
    res := {}
    VarSetCapacity(buf, 4096, 0)
    Loop, % nSec
    {
        s     := secTab + (A_Index - 1) * 40
        vsize := readDWORD(hGTA, s + 8)
        va    := readDWORD(hGTA, s + 12)
        chars := readDWORD(hGTA, s + 36)
        if (!(chars & 0x80000000))
            continue
        addr := dwAGG + va
        stop := addr + vsize
        while (addr < stop) {
            len := (stop - addr < 4096) ? (stop - addr) : 4096
            got := 0
            if (DllCall("ReadProcessMemory", "Ptr", hGTA, "Ptr", addr, "Ptr", &buf, "UPtr", len, "UPtrP", got) && got >= 4) {
                rel := addr - dwAGG
                Loop, % got // 4
                {
                    if (NumGet(buf, (A_Index - 1) * 4, "UInt") = id)
                        res[rel + (A_Index - 1) * 4] := 1
                }
            }
            addr += len
        }
    }
    return res
}

SC_Save(off) {
    global SPEC_ID_OFFSET
    SPEC_ID_OFFSET := off
    stamp := SpecModuleStamp()
    IniWrite, % Format("0x{:X}", off), %A_ScriptDir%\offsets.ini, aggmain, SpecIdOffset
    IniWrite, %stamp%, %A_ScriptDir%\offsets.ini, aggmain, Stamp
    if (ErrorLevel)
        MsgBox, 48, Калибровка, Не удалось записать offsets.ini в %A_ScriptDir%.`nДо перезапуска скрипта смещение работает, но потом слетит. Запусти от администратора или перенеси скрипт в папку с правами записи.
}

; ID игрока для Alt+2 / Alt+3 / Alt+4
GetTargetID() {
    global currentTarget
    if (SpecIdTrusted()) {
        id := getSpID()
        if (id >= 0 && id < 1000)
            return id
    }
    if (currentTarget)
        return currentTarget
    InputBox, id, ID игрока, Не удалось определить ID автоматически (см. Ctrl+Alt+F8 / Ctrl+Alt+F9).`nВведи ID игрока:, , 380, 170
    if (ErrorLevel)
        return 0
    if id is integer
        return id + 0
    return 0
}

; true, если мы уверены, что игрок target вышел (слежка идёт не за ним)
SpecLost(target) {
    static warned := false
    if (!SpecIdTrusted()) {
        if (!warned) {
            warned := true
            addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Проверка выхода игрока выключена: смещение спека не откалибровано (Ctrl+Alt+F9).")
        }
        return false
    }
    return (getSpID() != target)
}
