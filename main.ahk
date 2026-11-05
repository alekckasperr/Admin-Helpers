; =====================================================================
;  Основной скрипт (восстановлен из основной_скрипт.exe, AutoHotkey v1.1.31)
;  Запуск: AutoHotkey v1.1.x  (v2 НЕ подойдёт)
;  Файлы в одной папке и с ТОЧНО такими именами: main.ahk, AutoSAMP.ahk, Sp.ahk, SpecCalib.ahk
;  Сборка в exe: Build.bat (Source = Launcher.ahk, Base = Unicode 32-bit) - лаунчер с настройками, внутри которого работает этот скрипт.
;  Этот файл можно по-прежнему запускать и отдельно, без лаунчера.
;  Комментарии из оригинала в exe не сохраняются, эти добавлены заново.
; =====================================================================
#SingleInstance, Force
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , R
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
DllCall("ntdll\ZwSetTimerResolution","Int",10000,"Int",1,"Int*",MyCurrentTimerResolution)

#Include AutoSAMP.ahk
#Include Sp.ahk

; ---------------------------- НАСТРОЙКИ ------------------------------
; Область поиска жёлтого цвета (XButton2) и сам цвет
ScanX1 := 1200
ScanY1 := 222
ScanX2 := 1880
ScanY2 := 294
YellColor := 0xedcb52
; Ник и флаги
Global nickn := "A. Wearner"
global monitorAC := true
global AC_Queue := []
global AC_Counts := {}
global AC_Kicked := {}
global AC_Marked := {}
global currentTarget := 0
global currentTargetNick := ""
global currentTargetType := ""
global Exclusions := ""
global BulkSendQueue := []
global BulkSendTimerRunning := false
; Задержка (мс) между строками в окне массовой отправки (F12)
global BulkSendDelayMs := 100
global BulkGuiHwnd := 0
Global CHATLOG_PATH := AutoSAMP.getChatlogPath()
addChatMessageEx(0x12A48B, "")
sleep 1000
WinActivate, ahk_exe amazing.exe
WinWaitActive, ahk_exe amazing.exe,, 3
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Скрипт успешно запущен!")
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Никнейм: " AutoSAMP.getUsername())
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Сервер: " AutoSAMP.getServerName())
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff} /getpcar за кем следишь - Alt + 2")
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff} /flip за кем следишь - Alt + 3")
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff} /gruz за кем следишь - Alt + 4")
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff} Взять античит - Num 5")
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff} Взять античит из очереди - Num 6")
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff} Очередь античита - Num 7")
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff} Окно массовой отправки команд - F12")
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff} Погода - Alt + P")
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff} Окно очереди античита - Num 0")
addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff} Диагностика / калибровка ID спека - Ctrl+Alt+F8 / F9")
SendChat("/amask")
Sendinput, {F6}
sleep 200
Sendinput, /atracers
sleep 200
Sendinput, {enter}
SetTimer, GlobalChatMonitor, 70
if (IsLabel("ACQ_Startup"))
    SetTimer, ACQ_Startup, -1500

; Alt+2 - /getpcar на ID, за которым следишь
!2::
    playeridsp := GetTargetID()
    if (playeridsp)
        SendChat("/getpcar " playeridsp)
    Return

; Alt+3 - /flip
!3::
    playeridsp := GetTargetID()
    if (playeridsp)
        SendChat("/flip " playeridsp)
    Return

; Alt+4 - /gruz
!4::
    playeridsp := GetTargetID()
    if (playeridsp)
        SendChat("/gruz " playeridsp)
    Return

; Num5 - взять обычный AC из очереди (или закрыть текущий)
Numpad5::
    if (currentTarget == 0) {
        foundIdx := FindQueueIdx("AC")
        if (foundIdx != -1) {
            TakeQueueEntry(foundIdx)
        } else {
            addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Нет обычных AC в очереди.")
        }
    } else {
        SendInput, {F6}
        sleep 100
        SendInput, /a %currentTarget% 
        currentTarget := 0
    }
    return

; Num6 - взять Reconnect из очереди (или закрыть текущий)
Numpad6::
    if (currentTarget == 0) {
        foundIdx := FindQueueIdx("AC-Connect")
        if (foundIdx != -1) {
            TakeQueueEntry(foundIdx)
        } else {
            addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Нет Reconnect в очереди.")
        }
    } else {
        SendInput, {F6}
        sleep 100
        SendInput, /a [Reconnect] %currentTarget% 
        currentTarget := 0
    }
    return

; Num7 - показать очередь античита
Numpad7::
    if (AC_Queue.Length() == 0) {
        addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Очередь античита пуста.")
    } else {
        addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}=== Очередь античита (" . AC_Queue.Length() . ") ===")
        for idx, item in AC_Queue {
            addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}" . idx . ". ID: " . item.id . "  (" . item.type . ")")
        }
    }
    return

; Num8 - вкл/выкл мониторинг AC
Numpad8::
    monitorAC := !monitorAC
    if (monitorAC) {
        addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Мониторинг AC: {00FF00}ON")
    } else {
        addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Мониторинг AC: {FF0000}OFF")
        AC_Queue := []
    }
    return

; Alt+P - сменить погоду (перенесено из st.ahk, работает через функции из Sp.ahk)
!p::
    if (!WinActive("AMAZING ONLINE"))
        return
    InputBox, wID, Погода Amazing, Введите ID погоды (0-45):
    if (ErrorLevel)
        return
    if wID is not integer
    {
        addChatMessageEx("0xFF0000", "{FF0000}[Ошибка] ID погоды должен быть числом.")
        return
    }
    if (wID < 0 || wID > 45) {
        addChatMessageEx("0xFF0000", "{FF0000}[Ошибка] ID погоды должен быть от 0 до 45.")
        return
    }
    if (!checkHandles()) {
        MsgBox, 48, Погода, Игра не найдена или скрипт запущен не от администратора.
        return
    }
    dwMP := dwSAMP
    if (!dwMP)
        dwMP := getModuleBaseAddress("samp.dll", hGTA)
    ptrPools := dwMP ? readDWORD(hGTA, dwMP + 0x21A0F8) : 0
    if (ptrPools) {
        VarSetCapacity(wBuf, 4, 0)
        NumPut(wID, wBuf, 0, "Int")
        writeRaw(hGTA, ptrPools + 0x13C, &wBuf, 4)
        writeRaw(hGTA, ptrPools + 0x140, &wBuf, 4)
        addChatMessageEx("0x00FF00", "{00FF00}[AHK] Погода изменена на ID: " . wID)
    } else {
        addChatMessageEx("0xFF0000", "{FF0000}[Ошибка] Не удалось найти структуру погоды (адрес/модуль).")
    }
    return

; F12 - окно массовой отправки команд
F12::
    ToggleBulkSendWindow()
    return

ToggleBulkSendWindow() {
    global BulkGuiHwnd, BulkSendDelayMs
    if (BulkGuiHwnd && WinExist("ahk_id " BulkGuiHwnd)) {
        Gui, Bulk:Show
        WinActivate, ahk_id %BulkGuiHwnd%
        return
    }
    Gui, Bulk:New, +HwndBulkGuiHwnd, Отправка команд
    Gui, Bulk:Font, s10, Segoe UI
    Gui, Bulk:Add, Text, w620, Вставь строки (каждая строка будет отправлена отдельной командой с задержкой %BulkSendDelayMs% мс):
    Gui, Bulk:Add, Edit, vBulkText w620 h320 WantTab
    Gui, Bulk:Add, Button, gBulkSend w140, Отправить
    Gui, Bulk:Add, Button, gBulkClear x+10 w140, Очистить
    Gui, Bulk:Add, Button, gBulkHide x+10 w140, Скрыть
    Gui, Bulk:Show
}

BulkSend:
    Gui, Bulk:Submit, NoHide
    StartBulkSend(BulkText)
    return

BulkClear:
    GuiControl, Bulk:, BulkText,
    return

BulkHide:
    Gui, Bulk:Hide
    return

BulkGuiEscape:

BulkGuiClose:
    Gui, Bulk:Hide
    return

StartBulkSend(text) {
    global BulkSendQueue, BulkSendTimerRunning, BulkSendDelayMs
    BulkSendQueue := []
    for _, raw in StrSplit(text, "`n", "`r") {
        line := Trim(raw)
        if (line != "")
        BulkSendQueue.Push(line)
    }
    if (BulkSendQueue.Length() == 0) {
        addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Нет строк для отправки.")
        return
    }
    if (!BulkSendTimerRunning) {
        BulkSendTimerRunning := true
        SetTimer, BulkSendTick, %BulkSendDelayMs%
    }
}

; Таймер отправки строк из очереди
BulkSendTick:
    global BulkSendQueue, BulkSendTimerRunning
    if (BulkSendQueue.Length() == 0) {
        SetTimer, BulkSendTick, Off
        BulkSendTimerRunning := false
        return
    }
    cmd := BulkSendQueue.RemoveAt(1)
    SendChat(cmd)
    return

; Боковая кнопка мыши 2 - приветствие по жалобе + поиск ника
XButton2::
    Click
    sleep 300
    SendMessage, 0x50,, 0x4190419,, A
    SendInput, Здравствуйте. Начинаю работать по Вашей жалобе
    sleep 300
    SendInput, {enter}
    PixelSearch, FoundX, FoundY, %ScanX1%, %ScanY1%, %ScanX2%, %ScanY2%, %YellColor%, 10, Fast RGB
    if (ErrorLevel = 0) {
        Click right, %FoundX%, %FoundY%
        Sleep, 400
        NewX := FoundX + 10
        NewY := FoundY + 10
        Click, %NewX%, %NewY%
    } else {
    }
    Return

; Num- (минус) - перезагрузка скрипта
vk6D::
    addChatMessageEx(0xFFFFFF, "{F3A602}[Kasperr] {ffffff} Перезапускаю скрипт.")
    Reload
    return

GetNewLine(CRMP_CHATLOG_FILE) {
    static lastSize := -1
    static pending := []
    if (pending.Length() > 0)
    return pending.RemoveAt(1)
    file := FileOpen(CRMP_CHATLOG_FILE, "r", "CP1251")
    if !IsObject(file)
    return ""
    newSize := file.Length
    if (lastSize == -1) {
        lastSize := newSize
        file.Close()
        return ""
    }
    if (newSize < lastSize)
    lastSize := 0
    if (newSize <= lastSize) {
        file.Close()
        return ""
    }
    file.Seek(lastSize)
    content := file.Read()
    lastSize := newSize
    file.Close()
    lines := StrSplit(content, "`n", "`r")
    for _, raw in lines {
        currentLine := Trim(raw)
        if (currentLine != "")
        pending.Push(currentLine)
    }
    if (pending.Length() > 0)
    return pending.RemoveAt(1)
    return ""
}

; Таймер (70 мс): читает новые строки чатлога
GlobalChatMonitor:
    while (line := GetNewLine(CHATLOG_PATH)) {
        ProcessSystemEvents(line)
        ACQ_WatchTarget(line)
        if (monitorAC)
        ProcessAC(line)
    }
    return

ProcessSystemEvents(line) {
    if (RegExMatch(line, "!очередь")) {
        if (AC_Queue.Length() == 0) {
            addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}Очередь античита пуста.")
        } else {
            addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}=== Очередь античита (" . AC_Queue.Length() . ") ===")
            for idx, item in AC_Queue {
                addChatMessageEx(0x12A48B, "{F3A602}[Kasperr] {ffffff}" . idx . ". ID: " . item.id . "  (" . item.type . ")")
            }
        }
        return
    }
    if (RegExMatch(line, "\[Админ-функции\] Уровень доступа: 2")) {
        addChatMessageEx(0xFFFFFF, "{F3A602}[Kasperr] {ffffff}Обнаружено повышение. Перезагрузка...")
        Reload
    }
}

ProcessAC(line) {
    if (InStr(line, "«AC-Connect»")) {
        if (RegExMatch(line, "«AC-Connect»\s+(\S+)\s+\[(\d+)\]\s*(?:\((\d+)\s*ур\.\)\s*)?подключился к серверу, был кикнут (\d+) сек\. назад\. Причина:\s*(.*)$", c)) {
            ACQ_AddEvent("AC-Connect", c1, c2, c3, "Reconnect (кикнут " . c4 . " с назад): " . ACQ_CleanReason(c5))
        } else if (RegExMatch(line, "«AC-Connect».*?\[(\d+)\]", c)) {
            ACQ_AddEvent("AC-Connect", "", c1, "", "Reconnect")
        }
        return
    }
    if (InStr(line, "«AC»")) {
        if (RegExMatch(line, "«AC»\s+(\S+)\s+\[(\d+)\]\s*(?:\((\d+)\s*ур\.\)\s*)?(возможно|кикнут:)\s*(.*)$", a)) {
            if (a4 == "кикнут:") {
                RemoveACIDFromQueue(a2)
                return
            }
            ACQ_AddEvent("AC", a1, a2, a3, ACQ_CleanReason(a5))
        } else if (RegExMatch(line, "«AC».*?\[(\d+)\]", a)) {
            if (InStr(line, "кикнут")) {
                RemoveACIDFromQueue(a1)
                return
            }
            ACQ_AddEvent("AC", "", a1, "", "")
        }
    }
    if (RegExMatch(line, "\[A\].*?\s*\[CL\]\s*(\d+)", adminMatch)) {
        takenID := adminMatch1
        RemoveACIDFromQueue(takenID)
    }
    if (RegExMatch(line, "^\[\d{2}:\d{2}:\d{2}\]\s*\[A\][^:]*:\s*(.*)$", msgMatch)) {
        msg := msgMatch1
        pos := 1
        while (foundPos := RegExMatch(msg, "(?<!\d)(\d{1,6})(?:\s*\+)?(?!\d)", m, pos)) {
            possibleID := m1
            RemoveACIDFromQueue(possibleID)
            pos := foundPos + StrLen(m)
        }
    }
}

RemoveACIDFromQueue(id) {
    global AC_Queue
    for index, item in AC_Queue {
        if (item.id == id) {
            AC_Queue.RemoveAt(index)
            return true
        }
    }
    return false
}

; ---------- Калибровка ID спека (Ctrl+Alt+F8 / Ctrl+Alt+F9) ----------
; Подключается В САМОМ КОНЦЕ (внутри есть хоткеи).
#Include SpecCalib.ahk

; ---------- Окно очереди античита (Num 0) ----------
; Подключается В САМОМ КОНЦЕ (внутри есть хоткей).
#Include QueueGui.ahk
