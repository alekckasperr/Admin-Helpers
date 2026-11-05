; =====================================================================
;  LauncherGui.ahk - окно лаунчера и настроек (подключается из Launcher.ahk)
;
;  Вкладки: Главная (запуск / перезапуск / остановка скрипта), Окно очереди, Мини-окно, Тема, Система.
;  Настройки пишутся в queue_window.ini (разделы [queue], [mini], [theme], [launcher]).
;  Кнопка "Применить" сохраняет настройки и сразу перерисовывает окна очереди и мини-окно.
;  Значок в трее: двойной клик - открыть настройки. Ctrl+Alt+F10 - открыть настройки из игры.
;  Закрыть окно крестиком: пока скрипт работает - окно уходит в трей, скрипт продолжает работать.
;  Только функции, метки и хоткей - подключается ПОСЛЕ main.ahk.
; =====================================================================
global LAUNCH_Go, LAUNCH_Running, LAUNCH_Ini, LAUNCH_Tab, LAUNCH_Hwnd, LAUNCH_NoAuto, LAUNCH_Seen
global LAUNCH_AutoWait, LAUNCH_AutoDelay, LAUNCH_HideOnStart, LAUNCH_GameExe, LAUNCH_TC, LAUNCH_LastSt, LAUNCH_LastGm, LAUNCH_PendMsg

^!F10::
    Suspend, Permit
    LAUNCH_ShowWin()
    return

; ---------------------------------------------------------------------
;  Запуск лаунчера
; ---------------------------------------------------------------------
LAUNCH_Boot() {
    global LAUNCH_Go, LAUNCH_Running, LAUNCH_Ini, LAUNCH_Tab, LAUNCH_NoAuto, LAUNCH_HideOnStart, LAUNCH_Hwnd, LAUNCH_TC, LAUNCH_Seen, LAUNCH_PendMsg
    Suspend, On
    LAUNCH_Go := false
    LAUNCH_Running := false
    LAUNCH_NoAuto := false
    LAUNCH_Seen := 0
    LAUNCH_PendMsg := ""
    LAUNCH_Tab := 1
    LAUNCH_Hwnd := 0
    LAUNCH_TC := {}
    LAUNCH_Ini := A_ScriptDir . "\queue_window.ini"
    LAUNCH_AdminCheck()
    LAUNCH_LoadCfg()
    IniRead, mode, %LAUNCH_Ini%, launcher, BootMode, NONE
    IniDelete, %LAUNCH_Ini%, launcher, BootMode
    LAUNCH_TrayInit()
    SetTimer, LAUNCH_StatusTick, 1000
    if (mode == "start") {
        LAUNCH_Go := true
        if (!LAUNCH_HideOnStart) {
            LAUNCH_ShowWin()
        }
    } else {
        if (mode == "stop") {
            LAUNCH_NoAuto := true
        }
        LAUNCH_ShowWin()
    }
}

; Пока не нажали "Запустить" (или не сработал автозапуск по игре) - просто ждём
LAUNCH_WaitLoop() {
    global LAUNCH_Go, LAUNCH_NoAuto, LAUNCH_AutoWait, LAUNCH_AutoDelay, LAUNCH_GameExe, LAUNCH_Seen
    while (!LAUNCH_Go) {
        if (LAUNCH_AutoWait && !LAUNCH_NoAuto) {
            Process, Exist, %LAUNCH_GameExe%
            if (ErrorLevel) {
                if (!LAUNCH_Seen) {
                    LAUNCH_Seen := A_TickCount
                } else if (A_TickCount - LAUNCH_Seen >= LAUNCH_AutoDelay * 1000) {
                    LAUNCH_Go := true
                }
            } else {
                LAUNCH_Seen := 0
            }
        } else {
            LAUNCH_Seen := 0
        }
        Sleep, 250
    }
}

; Вызывается один раз, сразу перед стартом основного скрипта (main.ahk)
LAUNCH_OnStart() {
    global LAUNCH_Running, LAUNCH_HideOnStart, LAUNCH_Hwnd
    LAUNCH_Running := true
    if (LAUNCH_Hwnd) {
        LAUNCH_UpdateState()
        LAUNCH_Tab1Btns()
        if (LAUNCH_HideOnStart) {
            Gui, LAUNCH:Hide
        }
    }
    Suspend, Off
}

LAUNCH_LoadCfg() {
    global LAUNCH_Ini, LAUNCH_AutoWait, LAUNCH_AutoDelay, LAUNCH_HideOnStart, LAUNCH_GameExe
    IniRead, v, %LAUNCH_Ini%, launcher, AutoWait, 0
    LAUNCH_AutoWait := (v + 0) ? 1 : 0
    IniRead, v, %LAUNCH_Ini%, launcher, AutoDelay, 10
    LAUNCH_AutoDelay := Max(0, Min(300, v + 0))
    IniRead, v, %LAUNCH_Ini%, launcher, HideOnStart, 1
    LAUNCH_HideOnStart := (v + 0) ? 1 : 0
    IniRead, v, %LAUNCH_Ini%, launcher, GameExe, amazing.exe
    v := Trim(v)
    LAUNCH_GameExe := (v == "") ? "amazing.exe" : v
}

; Если в настройках включено "запрашивать права администратора" - перезапускаемся с правами
LAUNCH_AdminCheck() {
    global LAUNCH_Ini
    IniRead, ra, %LAUNCH_Ini%, launcher, RunAsAdmin, 0
    if ((ra + 0) && !A_IsAdmin) {
        try {
            if (A_IsCompiled) {
                Run, *RunAs "%A_ScriptFullPath%"
            } else {
                Run, *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
            }
            ExitApp
        } catch e {
            ; UAC отклонили - продолжаем без прав администратора
        }
    }
}

LAUNCH_TrayInit() {
    Menu, Tray, NoStandard
    Menu, Tray, Add, Настройки, LAUNCH_TrayOpen
    Menu, Tray, Add, Запустить скрипт, LAUNCH_TrayStart
    Menu, Tray, Add, Перезапустить скрипт, LAUNCH_TrayRestart
    Menu, Tray, Add, Остановить скрипт, LAUNCH_TrayStop
    Menu, Tray, Add
    Menu, Tray, Add, Выход, LAUNCH_TrayExit
    Menu, Tray, Default, Настройки
    Menu, Tray, Tip, Kasperr AdminHelper
}

; mode: "start" - после перезапуска сразу запустить скрипт, "stop" - остаться в лаунчере и ждать
LAUNCH_Reload(mode) {
    global LAUNCH_Ini
    IniWrite, %mode%, %LAUNCH_Ini%, launcher, BootMode
    Reload
    Sleep, 1500
}

LAUNCH_CloseWin() {
    global LAUNCH_Running
    if (LAUNCH_Running) {
        Gui, LAUNCH:Hide
    } else {
        ExitApp
    }
}

; ---------------------------------------------------------------------
;  Окно
; ---------------------------------------------------------------------
LAUNCH_ShowWin() {
    global LAUNCH_Hwnd
    if (LAUNCH_Hwnd && DllCall("IsWindowVisible", "Ptr", LAUNCH_Hwnd)) {
        WinActivate, ahk_id %LAUNCH_Hwnd%
        return
    }
    LAUNCH_Flush()
    LAUNCH_Rebuild(false)
}

; Пересоздаёт окно лаунчера (цвета и значения читаются из ini заново)
LAUNCH_Rebuild(keepPos := true) {
    global LAUNCH_Hwnd, LAUNCH_Tab
    px := ""
    py := ""
    if (keepPos && LAUNCH_Hwnd) {
        WinGetPos, px, py, , , ahk_id %LAUNCH_Hwnd%
    }
    Gui, LAUNCH:Destroy
    LAUNCH_Build(LAUNCH_Tab)
    if (px != "" && px > -30000) {
        Gui, LAUNCH:Show, x%px% y%py% w560 h440
    } else {
        Gui, LAUNCH:Show, w560 h440
    }
    ACQ_DarkTitle(LAUNCH_Hwnd)
    LAUNCH_UpdateState()
    LAUNCH_Tab1Btns()
}

; Сохранить в ini текущее состояние рабочих окон (чтобы лаунчер показал актуальные значения)
LAUNCH_Flush() {
    global ACQ_Built, MINI_Built
    if (ACQ_Built) {
        ACQ_SaveSettings()
    }
    if (MINI_Built) {
        MINI_SaveSettings()
    }
}

; Перерисовать окно очереди и мини-окно (после смены темы / настроек)
LAUNCH_RebuildWindows() {
    global ACQ_Built, ACQ_Visible, ACQ_Sig, ACQ_LastTitle, MINI_Built, MINI_Visible
    wasQ := ACQ_Visible
    if (ACQ_Built) {
        SetTimer, ACQ_Tick, Off
        SetTimer, ACQ_HoverTick, Off
        Gui, ACQ:Destroy
        ACQ_Built := false
        ACQ_Visible := false
        ACQ_Sig := ""
        ACQ_LastTitle := ""
    }
    wasM := MINI_Visible
    if (MINI_Built) {
        SetTimer, MINI_Tick, Off
        Gui, MINI:Destroy
        MINI_Built := false
        MINI_Visible := false
    }
    ACQ_LoadTheme(true)
    if (wasQ) {
        ACQ_Build()
        ACQ_Show()
    }
    if (wasM) {
        MINI_Toggle()
    }
}

LAUNCH_Msg(text) {
    Gui, LAUNCH:Default
    GuiControl, , LH_Msg, %text%
    SetTimer, LAUNCH_MsgClear, -4000
}

LAUNCH_ColorKeys() {
    return ["Bg", "Panel", "Accent", "Text", "Dim", "Ok", "Warn", "Bad"]
}

LAUNCH_PresetCols(n) {
    p := []
    p[1] := ["1B1030", "241540", "7C3AED", "EDE9FE", "A78BFA", "4ADE80", "FBBF24", "F87171"]
    p[2] := ["0F172A", "16233F", "2563EB", "E0F2FE", "7DD3FC", "4ADE80", "FBBF24", "F87171"]
    p[3] := ["1A1A1A", "242424", "4B5563", "F3F4F6", "9CA3AF", "4ADE80", "FBBF24", "F87171"]
    p[4] := ["0B1F17", "12301F", "059669", "D1FAE5", "6EE7B7", "4ADE80", "FBBF24", "F87171"]
    p[5] := ["240F14", "331820", "BE123C", "FFE4E6", "FDA4AF", "4ADE80", "FBBF24", "F87171"]
    return p[n]
}

; ---------------------------------------------------------------------
;  Элементы окна (все функции ниже - "assume-global": переменные элементов глобальные)
; ---------------------------------------------------------------------
LAUNCH_Reg(tab, name) {
    global LAUNCH_TC
    LAUNCH_TC[tab] := LAUNCH_TC[tab] . name . ","
}

LAUNCH_AddLbl(tab, name, txt, x, y, w, h := 20, dimmed := false) {
    global
    local col, bgc
    col := dimmed ? ACQ_T.Dim : ACQ_T.Text
    bgc := ACQ_T.Bg
    Gui, LAUNCH:Font, s9 norm q4 c%col%, Segoe UI
    Gui, LAUNCH:Add, Text, v%name% x%x% y%y% w%w% h%h% Background%bgc%, %txt%
    LAUNCH_Reg(tab, name)
}

LAUNCH_AddBtn(tab, name, txt, x, y, w, h, glabel) {
    global
    local acc
    acc := ACQ_T.Accent
    Gui, LAUNCH:Font, s9 norm q4 cFFFFFF, Segoe UI
    Gui, LAUNCH:Add, Text, v%name% g%glabel% x%x% y%y% w%w% h%h% Center +0x200 Background%acc%, %txt%
    LAUNCH_Reg(tab, name)
}

LAUNCH_AddChk(tab, name, txt, x, y, w, val) {
    global
    local tc
    tc := ACQ_T.Text
    Gui, LAUNCH:Font, s9 norm q4 c%tc%, Segoe UI
    Gui, LAUNCH:Add, Checkbox, v%name% x%x% y%y% w%w% h22 -Theme BackgroundTrans c%tc%, %txt%
    GuiControl, LAUNCH:, %name%, % (val ? 1 : 0)
    LAUNCH_Reg(tab, name)
}

LAUNCH_AddEdit(tab, name, x, y, w, val, opt := "Number") {
    global
    local tc, pn
    tc := ACQ_T.Text
    pn := ACQ_T.Panel
    Gui, LAUNCH:Font, s9 norm q4 c%tc%, Segoe UI
    Gui, LAUNCH:Add, Edit, v%name% x%x% y%y% w%w% h22 %opt% Background%pn% c%tc%, %val%
    LAUNCH_Reg(tab, name)
}

LAUNCH_AddSlider(tab, name, x, y, w, val, glabel) {
    global
    Gui, LAUNCH:Add, Slider, v%name% g%glabel% x%x% y%y% w%w% h24 Range60-255 NoTicks ToolTip BackgroundTrans, %val%
    LAUNCH_Reg(tab, name)
}

LAUNCH_AddDDL(tab, name, x, y, w, items, idx, glabel := "") {
    global
    local tc, pn, g
    tc := ACQ_T.Text
    pn := ACQ_T.Panel
    g := (glabel != "") ? "g" . glabel : ""
    Gui, LAUNCH:Font, s9 norm q4 c%tc%, Segoe UI
    Gui, LAUNCH:Add, DropDownList, v%name% %g% x%x% y%y% w%w% r10 AltSubmit Choose%idx% Background%pn% c%tc%, %items%
    LAUNCH_Reg(tab, name)
}

LAUNCH_AddSwatch(tab, name, x, y, col) {
    global
    Gui, LAUNCH:Add, Progress, v%name% x%x% y%y% w44 h20 -Theme c%col% Background%col%, 100
    LAUNCH_Reg(tab, name)
}

LAUNCH_Build(tab := 1) {
    global
    local bg, panel, acc, txt, dim, f, v, i, k, y, bx, bw, keys, names, qAlpha, qPin, qTrans, qFont, mAlpha, mWarn, mBad, mShow, cur, presetIdx, presetList, pidx, same, ver
    f := LAUNCH_Ini
    LAUNCH_TC := {}
    LAUNCH_LastSt := ""
    LAUNCH_LastGm := ""
    ACQ_LoadTheme(true)
    bg := ACQ_T.Bg
    panel := ACQ_T.Panel
    acc := ACQ_T.Accent
    txt := ACQ_T.Text
    dim := ACQ_T.Dim

    ; --- значения из ini
    IniRead, qAlpha, %f%, queue, Alpha, 255
    IniRead, qPin, %f%, queue, Pin, FREE
    IniRead, qTrans, %f%, queue, TransBg, 1
    IniRead, qFont, %f%, queue, FontSize, 8
    IniRead, mAlpha, %f%, mini, Alpha, 255
    IniRead, mWarn, %f%, mini, WarnSec, 60
    IniRead, mBad, %f%, mini, BadSec, 180
    IniRead, mShow, %f%, mini, Visible, 0
    IniRead, mW, %f%, mini, W, 190
    IniRead, mH, %f%, mini, H, 64
    IniRead, mFontSize, %f%, mini, FontSize, 18
    IniRead, mFontName, %f%, mini, FontName, Segoe UI
    if (LAUNCH_Running) {
        mShow := MINI_Visible ? 1 : 0
    }
    qAlpha := Max(60, Min(255, qAlpha + 0))
    mAlpha := Max(60, Min(255, mAlpha + 0))
    mW := Max(90, Min(800, mW + 0))
    mH := Max(40, Min(400, mH + 0))
    mFontSize := Max(7, Min(48, mFontSize + 0))
    miniFonts := ["Segoe UI", "Arial", "Tahoma", "Verdana", "Consolas", "Trebuchet MS"]
    mFontIdx := 1
    for i, fontName in miniFonts {
        if (fontName = mFontName)
            mFontIdx := i
    }
    qFont := Max(7, Min(16, qFont + 0))
    if (qPin == "FREE") {
        qPin := ""
    }

    Gui, LAUNCH:New, +HwndLAUNCH_Hwnd -MaximizeBox, Kasperr AdminHelper
    Gui, LAUNCH:Color, %bg%, %panel%
    Gui, LAUNCH:Margin, 0, 0

    ; --- заголовок
    Gui, LAUNCH:Font, s15 bold q4 c%txt%, Segoe UI
    Gui, LAUNCH:Add, Text, x20 y10 w360 h30 BackgroundTrans, Kasperr AdminHelper
    Gui, LAUNCH:Font, s9 norm q4 c%dim%, Segoe UI
    ver := "версия " . ACQ_Version()
    Gui, LAUNCH:Add, Text, x380 y18 w160 h20 Right BackgroundTrans, %ver%

    ; --- вкладки: для каждой по две кнопки (активная / неактивная), показывается одна из пары
    names := "Главная|Окно очереди|Мини-окно|Тема|Система"
    Loop, Parse, names, |
    {
        i := A_Index
        v := A_LoopField
        ; левый край и ширина кнопок: 20/100, 124/110, 238/100, 342/80, 426/100
        if (i == 1) {
            bx := 20
            bw := 100
        } else if (i == 2) {
            bx := 124
            bw := 110
        } else if (i == 3) {
            bx := 238
            bw := 100
        } else if (i == 4) {
            bx := 342
            bw := 80
        } else {
            bx := 426
            bw := 100
        }
        Gui, LAUNCH:Font, s9 norm q4 cFFFFFF, Segoe UI
        Gui, LAUNCH:Add, Text, vLTa%i% gLAUNCH_TabClick x%bx% y50 w%bw% h28 Center +0x200 Background%acc%, %v%
        Gui, LAUNCH:Add, Text, vLTi%i% gLAUNCH_TabClick x%bx% y50 w%bw% h28 Center +0x200 Background%panel%, %v%
    }

    ; =================== вкладка 1: Главная ===================
    Gui, LAUNCH:Font, s11 bold q4 c%txt%, Segoe UI
    Gui, LAUNCH:Add, Text, vL1_State x24 y100 w510 h24 Background%bg%, Скрипт: не запущен
    LAUNCH_Reg(1, "L1_State")
    LAUNCH_AddLbl(1, "L1_Game", "Игра: ...", 24, 128, 510, 20)
    LAUNCH_AddBtn(1, "L1_Start", "Запустить скрипт", 24, 164, 200, 32, "LAUNCH_BtnStart")
    LAUNCH_AddBtn(1, "L1_Restart", "Перезапустить (очередь сбросится)", 24, 164, 250, 32, "LAUNCH_BtnRestart")
    LAUNCH_AddBtn(1, "L1_Stop", "Остановить", 282, 164, 120, 32, "LAUNCH_BtnStop")
    LAUNCH_AddBtn(1, "L1_OpenQ", "Окно очереди (Num0)", 24, 204, 200, 30, "LAUNCH_BtnOpenQ")
    LAUNCH_AddBtn(1, "L1_OpenMini", "Мини-окно (Ctrl+Num9)", 232, 204, 200, 30, "LAUNCH_BtnOpenMini")
    LAUNCH_AddChk(1, "L1_AutoWait", "Запускать скрипт сам, когда запущена игра, через", 24, 256, 330, LAUNCH_AutoWait)
    LAUNCH_AddEdit(1, "L1_Delay", 360, 255, 44, LAUNCH_AutoDelay)
    LAUNCH_AddLbl(1, "L1_DelayT", "сек", 410, 258, 40)
    LAUNCH_AddChk(1, "L1_HideOnStart", "Прятать окно лаунчера в трей после запуска скрипта", 24, 288, 400, LAUNCH_HideOnStart)
    LAUNCH_AddLbl(1, "L1_Hint", "Закрытие окна крестиком не останавливает скрипт: он работает, пока работает лаунчер. Открыть настройки снова: значок в трее (двойной клик) или Ctrl+Alt+F10.", 24, 330, 510, 40, true)

    ; =================== вкладка 2: Окно очереди ===================
    LAUNCH_AddChk(2, "L2_Trans", "Прозрачный фон (режим HUD, как Ctrl+Numpad0)", 24, 100, 420, qTrans + 0)
    LAUNCH_AddLbl(2, "L2_AlphaL", "Прозрачность окна:", 24, 138, 150)
    LAUNCH_AddSlider(2, "L2_AlphaS", 180, 134, 230, qAlpha, "LAUNCH_Alpha2")
    LAUNCH_AddLbl(2, "L2_AlphaT", Round(qAlpha * 100 / 255) . "%", 420, 138, 60)
    LAUNCH_AddLbl(2, "L2_FontL", "Размер шрифта списка (7-16):", 24, 176, 190)
    LAUNCH_AddEdit(2, "L2_Font", 220, 173, 50, qFont)
    LAUNCH_AddLbl(2, "L2_PinL", "Закрепление окна:", 24, 214, 150)
    LAUNCH_AddDDL(2, "L2_Pin", 180, 211, 190, "Не закреплено|Слева-сверху|По центру-сверху|Справа-сверху|Слева-по центру|Справа-по центру|Слева-снизу|По центру-снизу|Справа-снизу|Своё место", ACQ_PinToIdx(qPin))
    LAUNCH_AddBtn(2, "L2_ResetSize", "Сбросить размер окна", 24, 262, 200, 30, "LAUNCH_BtnResetQSize")
    LAUNCH_AddBtn(2, "L2_ResetCols", "Сбросить ширину колонок", 232, 262, 220, 30, "LAUNCH_BtnResetCols")
    LAUNCH_AddLbl(2, "L2_Hint", "Размер окна меняется мышью (потяните за край) и запоминается отдельно для обычного и прозрачного режима. Ширина колонок - границы в заголовке списка.", 24, 314, 510, 40, true)

    ; =================== вкладка 3: Мини-окно ===================
    LAUNCH_AddChk(3, "L3_Show", "Показывать мини-окно (Ctrl+Numpad9), включается и при запуске", 24, 94, 480, mShow + 0)
    LAUNCH_AddLbl(3, "L3_AlphaL", "Прозрачность:", 24, 130, 130)
    LAUNCH_AddSlider(3, "L3_AlphaS", 160, 126, 230, mAlpha, "LAUNCH_Alpha3")
    LAUNCH_AddLbl(3, "L3_AlphaT", Round(mAlpha * 100 / 255) . "%", 400, 130, 60)

    LAUNCH_AddLbl(3, "L3_SizeL", "Размер окна (ширина × высота):", 24, 164, 245)
    LAUNCH_AddEdit(3, "L3_W", 270, 161, 60, mW)
    LAUNCH_AddEdit(3, "L3_H", 340, 161, 60, mH)

    LAUNCH_AddLbl(3, "L3_FontL", "Шрифт:", 24, 200, 80)
    miniFontList := "Segoe UI|Arial|Tahoma|Verdana|Consolas|Trebuchet MS"
    LAUNCH_AddDDL(3, "L3_FontName", 105, 196, 190, miniFontList, mFontIdx)
    LAUNCH_AddLbl(3, "L3_FontSizeL", "Размер:", 315, 200, 65)
    LAUNCH_AddEdit(3, "L3_FontSize", 380, 196, 55, mFontSize)

    LAUNCH_AddLbl(3, "L3_WarnL", "Жёлтый цвет после (сек):", 24, 238, 220)
    LAUNCH_AddEdit(3, "L3_Warn", 245, 235, 60, mWarn)
    LAUNCH_AddLbl(3, "L3_BadL", "Красный цвет после (сек):", 24, 274, 220)
    LAUNCH_AddEdit(3, "L3_Bad", 245, 271, 60, mBad)
    LAUNCH_AddBtn(3, "L3_Reset", "Сбросить размер и место", 24, 316, 220, 30, "LAUNCH_BtnResetMini")
    LAUNCH_AddLbl(3, "L3_Hint", "Размер можно менять здесь или мышью в игре. Шрифт и его размер не меняются при растягивании окна.", 24, 354, 510, 40, true)

    ; =================== вкладка 4: Тема ===================
    presetList := "Фиолетовая|Синяя|Графит|Зелёная|Бордо|Своя"
    keys := LAUNCH_ColorKeys()
    presetIdx := 6
    Loop, 5
    {
        pidx := A_Index
        cur := LAUNCH_PresetCols(pidx)
        same := true
        for i, k in keys {
            if (cur[i] != ACQ_T[k]) {
                same := false
            }
        }
        if (same) {
            presetIdx := pidx
        }
    }
    LAUNCH_AddLbl(4, "L4_PresetL", "Готовая тема:", 24, 102, 100)
    LAUNCH_AddDDL(4, "L4_Preset", 130, 99, 170, presetList, presetIdx, "LAUNCH_Preset")
    names := "Фон окна (Bg)|Панели и список (Panel)|Кнопки (Accent)|Основной текст (Text)|Неактивный текст (Dim)|Цифры: свежие (Ok)|Цифры: внимание (Warn)|Цифры: срочно (Bad)"
    Loop, Parse, names, |
    {
        i := A_Index
        k := keys[i]
        y := 136 + (i - 1) * 28
        LAUNCH_AddLbl(4, "L4_N" . i, A_LoopField, 24, y + 3, 165)
        LAUNCH_AddSwatch(4, "L4_S" . i, 196, y + 1, ACQ_T[k])
        LAUNCH_AddEdit(4, "L4_E" . i, 248, y, 80, ACQ_T[k], "Limit7 gLAUNCH_ColEdit")
        LAUNCH_AddBtn(4, "L4_P" . i, "...", 336, y, 30, 22, "LAUNCH_ColPick")
    }
    LAUNCH_AddLbl(4, "L4_Hint", "Цвет в формате RRGGBB. Кнопка «...» открывает палитру. Ok / Warn / Bad - цвета цифр мини-окна. «Применить» перекрашивает все окна сразу.", 390, 136, 150, 130, true)

    ; =================== вкладка 5: Система ===================
    LAUNCH_AddChk(5, "L5_Auto", "Запускать лаунчер вместе с Windows", 24, 100, 400, FileExist(A_Startup . "\Kasperr AdminHelper.lnk") ? 1 : 0)
    IniRead, v, %f%, launcher, RunAsAdmin, 0
    LAUNCH_AddChk(5, "L5_Admin", "Запрашивать права администратора при запуске", 24, 132, 400, v + 0)
    LAUNCH_AddLbl(5, "L5_GameL", "Процесс игры (для автозапуска):", 24, 172, 210)
    LAUNCH_AddEdit(5, "L5_Game", 240, 169, 160, LAUNCH_GameExe, "")
    LAUNCH_AddBtn(5, "L5_OpenDir", "Открыть папку программы", 24, 214, 200, 30, "LAUNCH_BtnOpenDir")
    LAUNCH_AddBtn(5, "L5_OpenIni", "Открыть queue_window.ini", 232, 214, 210, 30, "LAUNCH_BtnOpenIni")
    LAUNCH_AddBtn(5, "L5_OpenLog", "Открыть queue_debug.log", 24, 252, 200, 30, "LAUNCH_BtnOpenLog")
    LAUNCH_AddLbl(5, "L5_Hint", "Настройки лежат в queue_window.ini рядом с программой. Если на пк нужны права администратора - включите пункт выше, лаунчер сам перезапустится с запросом UAC.", 24, 314, 510, 40, true)

    ; --- нижняя панель
    LAUNCH_AddBtn(0, "LB_Apply", "Применить", 20, 398, 120, 30, "LAUNCH_BtnApply")
    LAUNCH_AddBtn(0, "LB_Close", "Закрыть", 148, 398, 100, 30, "LAUNCH_BtnClose")
    Gui, LAUNCH:Font, s9 norm q4 c%dim%, Segoe UI
    Gui, LAUNCH:Add, Text, vLH_Msg x262 y405 w280 h20 Background%bg%,

    LAUNCH_ShowTab(tab)
}

LAUNCH_ShowTab(n) {
    global LAUNCH_Tab, LAUNCH_TC
    Gui, LAUNCH:Default
    LAUNCH_Tab := n
    Loop, 5
    {
        i := A_Index
        if (i == n) {
            GuiControl, Hide, LTi%i%
            GuiControl, Show, LTa%i%
        } else {
            GuiControl, Hide, LTa%i%
            GuiControl, Show, LTi%i%
        }
        names := LAUNCH_TC[i]
        Loop, Parse, names, `,
        {
            if (A_LoopField == "") {
                continue
            }
            if (i == n) {
                GuiControl, Show, %A_LoopField%
            } else {
                GuiControl, Hide, %A_LoopField%
            }
        }
    }
    LAUNCH_Tab1Btns()
}

; На вкладке "Главная": пока скрипт не запущен - видна "Запустить", потом - "Перезапустить", "Остановить" и кнопки окон
LAUNCH_Tab1Btns() {
    global LAUNCH_Tab, LAUNCH_Running, LAUNCH_Hwnd
    if (!LAUNCH_Hwnd || LAUNCH_Tab != 1) {
        return
    }
    Gui, LAUNCH:Default
    if (LAUNCH_Running) {
        GuiControl, Hide, L1_Start
        GuiControl, Show, L1_Restart
        GuiControl, Show, L1_Stop
        GuiControl, Show, L1_OpenQ
        GuiControl, Show, L1_OpenMini
    } else {
        GuiControl, Show, L1_Start
        GuiControl, Hide, L1_Restart
        GuiControl, Hide, L1_Stop
        GuiControl, Hide, L1_OpenQ
        GuiControl, Hide, L1_OpenMini
    }
}

; Статус скрипта и игры
LAUNCH_UpdateState() {
    global LAUNCH_Running, LAUNCH_Hwnd, LAUNCH_GameExe, LAUNCH_AutoWait, LAUNCH_NoAuto, LAUNCH_Seen, LAUNCH_AutoDelay, LAUNCH_LastSt, LAUNCH_LastGm
    if (!LAUNCH_Hwnd) {
        return
    }
    Process, Exist, %LAUNCH_GameExe%
    gp := ErrorLevel
    Gui, LAUNCH:Default
    if (LAUNCH_Running) {
        st := "Скрипт: работает"
    } else if (LAUNCH_AutoWait && !LAUNCH_NoAuto && gp && LAUNCH_Seen) {
        left := Max(0, LAUNCH_AutoDelay - (A_TickCount - LAUNCH_Seen) // 1000)
        st := "Скрипт: запуск через " . left . " с"
    } else if (LAUNCH_AutoWait && !LAUNCH_NoAuto) {
        st := "Скрипт: ждёт запуска игры"
    } else {
        st := "Скрипт: не запущен"
    }
    gm := "Игра (" . LAUNCH_GameExe . "): " . (gp ? "запущена" : "не найдена")
    if (st != LAUNCH_LastSt) {
        GuiControl, , L1_State, %st%
        LAUNCH_LastSt := st
    }
    if (gm != LAUNCH_LastGm) {
        GuiControl, , L1_Game, %gm%
        LAUNCH_LastGm := gm
    }
}

; ---------------------------------------------------------------------
;  Применить настройки
; ---------------------------------------------------------------------
LAUNCH_Apply() {
    global
    local f, i, k, v, keys, bad, oldTheme, newTheme, pinCode, fs, ws, bs, dl, ge, lnk, newCols, mw, mh, mfs, mfn
    f := LAUNCH_Ini
    Gui, LAUNCH:Default
    Gui, LAUNCH:Submit, NoHide

    ; --- проверка цветов
    keys := LAUNCH_ColorKeys()
    newCols := []
    bad := ""
    oldTheme := ""
    newTheme := ""
    for i, k in keys {
        GuiControlGet, v, , L4_E%i%
        v := RegExReplace(Trim(v), "^#")
        if (!RegExMatch(v, "^[0-9A-Fa-f]{6}$")) {
            bad := k
            break
        }
        StringUpper, v, v
        newCols[i] := v
        oldTheme .= ACQ_T[k] . ","
        newTheme .= v . ","
    }
    if (bad != "") {
        LAUNCH_Msg("Неверный цвет в поле " . bad . " (нужен RRGGBB)")
        return
    }

    ; --- числа
    fs := Max(7, Min(16, L2_Font + 0))
    mw := Max(90, Min(800, L3_W + 0))
    mh := Max(40, Min(400, L3_H + 0))
    mfs := Max(7, Min(48, L3_FontSize + 0))
    miniFontNames := ["Segoe UI", "Arial", "Tahoma", "Verdana", "Consolas", "Trebuchet MS"]
    mfn := miniFontNames[Max(1, Min(6, L3_FontName + 0))]
    ws := Max(5, L3_Warn + 0)
    bs := Max(ws + 1, L3_Bad + 0)
    dl := Max(0, Min(300, L1_Delay + 0))
    ge := Trim(L5_Game)
    if (ge == "") {
        ge := "amazing.exe"
    }
    pinCode := ACQ_IdxToPin(L2_Pin)
    if (pinCode == "") {
        pinCode := "FREE"
    }

    ; --- сначала сохраняем текущее состояние рабочих окон, потом пишем настройки поверх
    if (LAUNCH_Running) {
        LAUNCH_Flush()
    }
    IniWrite, %L2_AlphaS%, %f%, queue, Alpha
    IniWrite, %pinCode%, %f%, queue, Pin
    IniWrite, % (L2_Trans ? 1 : 0), %f%, queue, TransBg
    IniWrite, %fs%, %f%, queue, FontSize
    IniWrite, %L3_AlphaS%, %f%, mini, Alpha
    IniWrite, %mw%, %f%, mini, W
    IniWrite, %mh%, %f%, mini, H
    IniWrite, %mfs%, %f%, mini, FontSize
    IniWrite, %mfn%, %f%, mini, FontName
    IniWrite, %ws%, %f%, mini, WarnSec
    IniWrite, %bs%, %f%, mini, BadSec
    if (!LAUNCH_Running) {
        IniWrite, % (L3_Show ? 1 : 0), %f%, mini, Visible
    }
    for i, k in keys {
        v := newCols[i]
        IniWrite, %v%, %f%, theme, %k%
    }
    IniWrite, % (L1_AutoWait ? 1 : 0), %f%, launcher, AutoWait
    IniWrite, %dl%, %f%, launcher, AutoDelay
    IniWrite, % (L1_HideOnStart ? 1 : 0), %f%, launcher, HideOnStart
    IniWrite, %ge%, %f%, launcher, GameExe
    IniWrite, % (L5_Admin ? 1 : 0), %f%, launcher, RunAsAdmin
    LAUNCH_LoadCfg()

    ; --- автозапуск с Windows
    lnk := A_Startup . "\Kasperr AdminHelper.lnk"
    if (L5_Auto) {
        FileCreateShortcut, %A_ScriptFullPath%, %lnk%, %A_ScriptDir%
    } else {
        FileDelete, %lnk%
    }

    ; --- перерисовать рабочие окна
    if (LAUNCH_Running) {
        LAUNCH_RebuildWindows()
        if (L3_Show && !MINI_Visible) {
            MINI_Toggle()
        } else if (!L3_Show && MINI_Visible) {
            MINI_Toggle()
        }
    }

    ; --- сменилась тема - перерисовать и сам лаунчер (чуть позже, когда закончится этот обработчик)
    if (oldTheme != newTheme) {
        ACQ_LoadTheme(true)
        LAUNCH_PendMsg := "Применено"
        SetTimer, LAUNCH_RebuildTimer, -80
    } else {
        LAUNCH_Msg("Применено")
    }
}

; Сброс ключей ini и перерисовка окон
LAUNCH_ResetKeys(section, keys) {
    global LAUNCH_Ini, LAUNCH_Running
    if (LAUNCH_Running) {
        LAUNCH_Flush()
    }
    Loop, Parse, keys, `,
    {
        IniDelete, %LAUNCH_Ini%, %section%, %A_LoopField%
    }
    if (LAUNCH_Running) {
        LAUNCH_RebuildWindows()
    }
    LAUNCH_Msg("Сброшено")
}

; Палитра Windows. Возвращает RRGGBB или "" если отменили
LAUNCH_PickColor(hwnd, hex) {
    static cust
    sz := (A_PtrSize == 8) ? 72 : 36
    VarSetCapacity(cc, sz, 0)
    VarSetCapacity(cust, 64, 0)
    hex := RegExReplace(Trim(hex), "^#")
    if (!RegExMatch(hex, "^[0-9A-Fa-f]{6}$")) {
        hex := "FFFFFF"
    }
    NumPut(sz, cc, 0, "UInt")
    NumPut(hwnd, cc, A_PtrSize, "Ptr")
    NumPut(ACQ_Rgb2Bgr(hex), cc, 3 * A_PtrSize, "UInt")
    NumPut(&cust, cc, 4 * A_PtrSize, "Ptr")
    NumPut(3, cc, 5 * A_PtrSize, "UInt")
    if (!DllCall("comdlg32\ChooseColor", "Ptr", &cc, "UInt")) {
        return ""
    }
    c := NumGet(cc, 3 * A_PtrSize, "UInt")
    return Format("{:02X}{:02X}{:02X}", c & 0xFF, (c >> 8) & 0xFF, (c >> 16) & 0xFF)
}

; ---------------------------------------------------------------------
;  Метки: вкладки, кнопки, трей
; ---------------------------------------------------------------------
LAUNCH_TabClick:
    LAUNCH_ShowTab(SubStr(A_GuiControl, 4))
    return

LAUNCH_BtnStart:
    LAUNCH_Go := true
    return

LAUNCH_BtnRestart:
    LAUNCH_Reload("start")
    return

LAUNCH_BtnStop:
    LAUNCH_Reload("stop")
    return

LAUNCH_BtnOpenQ:
    ACQ_Toggle()
    return

LAUNCH_BtnOpenMini:
    MINI_Toggle()
    return

LAUNCH_BtnApply:
    LAUNCH_Apply()
    return

LAUNCH_BtnClose:
    LAUNCH_CloseWin()
    return

LAUNCH_BtnResetQSize:
    LAUNCH_ResetKeys("queue", "W,H,TW,TH")
    return

LAUNCH_BtnResetCols:
    LAUNCH_ResetKeys("queue", "ColW1,ColW2,ColW3,ColW4,ColW5,ColW6,ColW7")
    return

LAUNCH_BtnResetMini:
    LAUNCH_ResetKeys("mini", "W,H,X,Y")
    return

LAUNCH_BtnOpenDir:
    Run, %A_ScriptDir%
    return

LAUNCH_BtnOpenIni:
    Run, notepad.exe "%A_ScriptDir%\queue_window.ini"
    return

LAUNCH_BtnOpenLog:
    if (FileExist(A_ScriptDir . "\queue_debug.log")) {
        Run, notepad.exe "%A_ScriptDir%\queue_debug.log"
    } else {
        LAUNCH_Msg("Файла queue_debug.log пока нет")
    }
    return

LAUNCH_Alpha2:
    GuiControlGet, lav, , L2_AlphaS
    GuiControl, , L2_AlphaT, % Round(lav * 100 / 255) . "%"
    return

LAUNCH_Alpha3:
    GuiControlGet, lav, , L3_AlphaS
    GuiControl, , L3_AlphaT, % Round(lav * 100 / 255) . "%"
    return

; Выбрали готовую тему - подставляем цвета в поля (применятся после "Применить")
LAUNCH_Preset:
    GuiControlGet, lpi, , L4_Preset
    if (lpi >= 1 && lpi <= 5) {
        lpc := LAUNCH_PresetCols(lpi)
        Loop, 8
        {
            lcol := lpc[A_Index]
            GuiControl, , L4_E%A_Index%, %lcol%
            GuiControl, +c%lcol% +Background%lcol%, L4_S%A_Index%
        }
    }
    return

; Правили hex руками - обновляем квадратик
LAUNCH_ColEdit:
    lidx := SubStr(A_GuiControl, 5)
    GuiControlGet, lcv, , L4_E%lidx%
    lcv := RegExReplace(Trim(lcv), "^#")
    if (RegExMatch(lcv, "^[0-9A-Fa-f]{6}$")) {
        GuiControl, +c%lcv% +Background%lcv%, L4_S%lidx%
    }
    return

LAUNCH_ColPick:
    lidx := SubStr(A_GuiControl, 5)
    GuiControlGet, lcv, , L4_E%lidx%
    lnew := LAUNCH_PickColor(LAUNCH_Hwnd, lcv)
    if (lnew != "") {
        GuiControl, , L4_E%lidx%, %lnew%
        GuiControl, +c%lnew% +Background%lnew%, L4_S%lidx%
    }
    return

LAUNCH_MsgClear:
    GuiControl, LAUNCH:, LH_Msg,
    return

LAUNCH_StatusTick:
    if (LAUNCH_Hwnd && DllCall("IsWindowVisible", "Ptr", LAUNCH_Hwnd)) {
        LAUNCH_UpdateState()
    }
    return

LAUNCH_RebuildTimer:
    LAUNCH_Rebuild(true)
    if (LAUNCH_PendMsg != "") {
        LAUNCH_Msg(LAUNCH_PendMsg)
        LAUNCH_PendMsg := ""
    }
    return

LAUNCHGuiClose:
    LAUNCH_CloseWin()
    return

LAUNCHGuiEscape:
    if (LAUNCH_Running) {
        Gui, LAUNCH:Hide
    }
    return

LAUNCH_TrayOpen:
    LAUNCH_ShowWin()
    return

LAUNCH_TrayStart:
    if (!LAUNCH_Running) {
        LAUNCH_Go := true
    }
    return

LAUNCH_TrayRestart:
    if (LAUNCH_Running) {
        LAUNCH_Reload("start")
    } else {
        LAUNCH_Go := true
    }
    return

LAUNCH_TrayStop:
    if (LAUNCH_Running) {
        LAUNCH_Reload("stop")
    }
    return

LAUNCH_TrayExit:
    ExitApp
    return
