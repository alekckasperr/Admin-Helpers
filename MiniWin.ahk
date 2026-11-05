; =====================================================================
;  MiniWin.ahk - мини-окно "сколько античита не обработано"
;
;  Ctrl+Numpad9 - показать / скрыть.  Клик по окну - открыть / закрыть основное окно очереди.
;  Размер окна меняется мышью независимо от шрифта; размер, место и "показывать при запуске"
;  запоминаются в queue_window.ini, раздел [mini]. Прозрачность: ключ Alpha (60..255).
;  Цвет цифр: серый - очередь пуста, зелёный - свежие записи, жёлтый - висят дольше WarnSec секунд
;  (по умолчанию 60), красный - дольше BadSec (по умолчанию 180). Оба порога меняются в лаунчере.
;  Правая кнопка мыши по окну - меню: основное окно, сбросить размер, скрыть. Прозрачность и шрифт задаются в лаунчере.
;  Подключается из QueueGui.ahk (внутри хоткей и метки).
; =====================================================================
global MINI_Built, MINI_Visible, MINI_Hwnd, MINI_Txt, MINI_W, MINI_H, MINI_X, MINI_Y, MINI_Alpha, MINI_Col, MINI_FS, MINI_FontName, MINI_Sig, MINI_Warn, MINI_Bad

^Numpad9::
    MINI_Toggle()
    return

; main.ahk запускает эту метку через 1.5 с после старта (если мини-окно было включено)
ACQ_Startup:
    MINI_Startup()
    return

MINI_Startup() {
    f := A_ScriptDir . "\queue_window.ini"
    IniRead, v, %f%, mini, Visible, 0
    if (v + 0)
        MINI_Toggle()
}

MINI_Toggle() {
    global MINI_Built, MINI_Visible
    if (!MINI_Built)
        MINI_Build()
    if (MINI_Visible)
        MINI_Hide()
    else
        MINI_Show()
}

MINI_LoadSettings() {
    global MINI_W, MINI_H, MINI_X, MINI_Y, MINI_Alpha, MINI_Warn, MINI_Bad, MINI_FS, MINI_FontName
    f := A_ScriptDir . "\queue_window.ini"
    IniRead, w, %f%, mini, W, 190
    IniRead, h, %f%, mini, H, 64
    IniRead, x, %f%, mini, X, NONE
    IniRead, y, %f%, mini, Y, NONE
    IniRead, a, %f%, mini, Alpha, 255
    IniRead, wsec, %f%, mini, WarnSec, 60
    IniRead, bsec, %f%, mini, BadSec, 180
    IniRead, fs, %f%, mini, FontSize, 18
    IniRead, font, %f%, mini, FontName, Segoe UI
    MINI_Warn := Max(5, wsec + 0)
    MINI_Bad := Max(MINI_Warn + 1, bsec + 0)
    MINI_W := Max(90, w + 0)
    MINI_H := Max(40, h + 0)
    MINI_Alpha := Max(60, Min(255, a + 0))
    MINI_FS := Max(7, Min(48, fs + 0))
    MINI_FontName := font
    if (x != "NONE" && y != "NONE") {
        MINI_X := x + 0
        MINI_Y := y + 0
    } else {
        MINI_X := A_ScreenWidth - 220
        MINI_Y := 12
    }
}

MINI_Build() {
    global MINI_Built, MINI_Hwnd, MINI_Txt, MINI_Col, MINI_FS, MINI_FontName, MINI_W, MINI_H, ACQ_T
    MINI_LoadSettings()
    ACQ_LoadTheme()
    bg := ACQ_T.Bg
    MINI_Col := ACQ_T.Dim
    Gui, MINI:New, +AlwaysOnTop +ToolWindow +E0x08000000 +Resize +MinSize90x40 +HwndMINI_Hwnd, Очередь AC
    Gui, MINI:Default
    Gui, MINI:Color, %bg%
    Gui, MINI:Margin, 0, 0
    Gui, MINI:Font, s%MINI_FS% bold q4 c%MINI_Col%, %MINI_FontName%
    Gui, MINI:Add, Text, vMINI_Txt gMINI_Click x0 y0 w%MINI_W% h%MINI_H% Center +0x200 Background%bg%, AC 0 · RE 0
    MINI_Built := true
}

MINI_Show() {
    global MINI_Visible, MINI_X, MINI_Y, MINI_W, MINI_H, MINI_Hwnd, MINI_Sig
    if (MINI_X < -200 || MINI_Y < -50 || MINI_X >= A_ScreenWidth - 30 || MINI_Y >= A_ScreenHeight - 30) {
        MINI_X := A_ScreenWidth - 220
        MINI_Y := 12
    }
    Gui, MINI:Show, x%MINI_X% y%MINI_Y% w%MINI_W% h%MINI_H% NoActivate
    MINI_Visible := true
    ACQ_DarkTitle(MINI_Hwnd)
    MINI_ApplyAlpha()
    MINI_Sig := ""
    MINI_Refresh(true)
    SetTimer, MINI_Tick, 500
    MINI_SaveSettings()
}

MINI_Hide() {
    global MINI_Visible, MINI_X, MINI_Y, MINI_Hwnd
    WinGetPos, wx, wy, , , ahk_id %MINI_Hwnd%
    if (wx != "") {
        MINI_X := wx
        MINI_Y := wy
    }
    Gui, MINI:Hide
    MINI_Visible := false
    SetTimer, MINI_Tick, Off
    MINI_SaveSettings()
}

MINI_ApplyAlpha() {
    global MINI_Alpha, MINI_Hwnd
    if (MINI_Alpha >= 255)
        WinSet, Transparent, Off, ahk_id %MINI_Hwnd%
    else
        WinSet, Transparent, %MINI_Alpha%, ahk_id %MINI_Hwnd%
}

; Считает очередь, выбирает цвет по самой старой записи и обновляет текст
MINI_Refresh(force := false) {
    global AC_Queue, MINI_Visible, MINI_Col, MINI_FS, MINI_FontName, MINI_Sig, ACQ_T, MINI_Warn, MINI_Bad
    if (!MINI_Visible || !IsObject(AC_Queue))
        return
    nAC := 0
    nRE := 0
    oldest := 0
    for i, it in AC_Queue {
        if (it.type == "AC-Connect")
            nRE++
        else
            nAC++
        age := (A_TickCount - it.t0) // 1000
        if (age > oldest)
            oldest := age
    }
    if (nAC + nRE == 0)
        col := ACQ_T.Dim
    else if (oldest < MINI_Warn)
        col := ACQ_T.Ok
    else if (oldest < MINI_Bad)
        col := ACQ_T.Warn
    else
        col := ACQ_T.Bad
    text := "AC " . nAC . " · RE " . nRE
    sig := text . "|" . col
    if (!force && sig == MINI_Sig)
        return
    MINI_Sig := sig
    MINI_Col := col
    Gui, MINI:Default
    Gui, MINI:Font, s%MINI_FS% bold q4 c%col%, %MINI_FontName%
    GuiControl, MINI:Font, MINI_Txt
    GuiControl, MINI:, MINI_Txt, %text%
}

; Если окно двигали - запоминаем новое место
MINI_CheckPos() {
    global MINI_Visible, MINI_X, MINI_Y, MINI_Hwnd
    if (!MINI_Visible)
        return
    WinGetPos, wx, wy, , , ahk_id %MINI_Hwnd%
    if (wx == "" || wx < -30000)
        return
    if (wx != MINI_X || wy != MINI_Y) {
        MINI_X := wx
        MINI_Y := wy
        SetTimer, MINI_SaveLater, -1500
    }
}

MINI_SaveSettings() {
    global MINI_Visible, MINI_X, MINI_Y, MINI_W, MINI_H, MINI_Alpha, MINI_FS, MINI_FontName
    f := A_ScriptDir . "\queue_window.ini"
    vis := MINI_Visible ? 1 : 0
    IniWrite, %MINI_X%, %f%, mini, X
    IniWrite, %MINI_Y%, %f%, mini, Y
    IniWrite, %MINI_W%, %f%, mini, W
    IniWrite, %MINI_H%, %f%, mini, H
    IniWrite, %MINI_Alpha%, %f%, mini, Alpha
    IniWrite, %MINI_FS%, %f%, mini, FontSize
    IniWrite, %MINI_FontName%, %f%, mini, FontName
    IniWrite, %vis%, %f%, mini, Visible
}

; Меню по правой кнопке мыши: основное окно, прозрачность, размер по умолчанию, скрыть
MINI_ShowMenu() {
    static built := false
    if (!built) {
        Menu, MINIM, Add, Основное окно, MINI_Click
        Menu, MINIM, Add, Размер по умолчанию, MINI_MenuReset
        Menu, MINIM, Add
        Menu, MINIM, Add, Скрыть, MINIGuiClose
        built := true
    }
    Menu, MINIM, Show
}

MINI_Tick:
    MINI_Refresh()
    MINI_CheckPos()
    return

MINI_SaveLater:
    MINI_SaveSettings()
    return

MINI_Click:
    ACQ_Toggle()
    return

MINIGuiSize:
    if (A_EventInfo = 1)
        return
    MINI_W := A_GuiWidth
    MINI_H := A_GuiHeight
    GuiControl, MINI:Move, MINI_Txt, x0 y0 w%A_GuiWidth% h%A_GuiHeight%
    MINI_Refresh(true)
    SetTimer, MINI_SaveLater, -1500
    return

MINIGuiContextMenu:
    MINI_ShowMenu()
    return

MINI_MenuAlpha:
    pct := RegExReplace(A_ThisMenuItem, "\D")
    MINI_Alpha := Max(60, Min(255, Round(255 * pct / 100)))
    MINI_ApplyAlpha()
    MINI_SaveSettings()
    return

MINI_MenuReset:
    MINI_W := 190
    MINI_H := 64
    Gui, MINI:Show, w190 h64 NoActivate
    return

MINIGuiClose:
    MINI_Hide()
    return
