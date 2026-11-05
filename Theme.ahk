; =====================================================================
;  Theme.ahk - цветовая тема окон (по умолчанию фиолетовая)
;
;  Цвета лежат в queue_window.ini, раздел [theme], в формате RRGGBB (можно с #):
;    Bg     - фон окна            Panel  - фон списка и панелей
;    Accent - кнопки              Text   - основной текст
;    Dim    - неактивный текст    Ok / Warn / Bad - зелёный / жёлтый / красный
;  Файлы-включения: подключается из QueueGui.ahk (только функции).
; =====================================================================
global ACQ_T

ACQ_LoadTheme(force := false) {
    global ACQ_T
    if (IsObject(ACQ_T) && !force)
        return
    ACQ_T := {}
    f := A_ScriptDir . "\queue_window.ini"
    defs := {Bg: "1B1030", Panel: "241540", Accent: "7C3AED", Text: "EDE9FE", Dim: "A78BFA", Ok: "4ADE80", Warn: "FBBF24", Bad: "F87171"}
    for k, d in defs {
        IniRead, v, %f%, theme, %k%, NONE
        if (v == "NONE")
            IniWrite, %d%, %f%, theme, %k%
        v := RegExReplace(Trim(v), "^#")
        if (!RegExMatch(v, "^[0-9A-Fa-f]{6}$"))
            v := d
        ACQ_T[k] := v
    }
}

; RRGGBB -> число для DWM (0x00BBGGRR)
ACQ_Rgb2Bgr(hex) {
    r := ("0x" . SubStr(hex, 1, 2)) + 0
    g := ("0x" . SubStr(hex, 3, 2)) + 0
    b := ("0x" . SubStr(hex, 5, 2)) + 0
    return (b << 16) | (g << 8) | r
}

; Тёмный заголовок окна (Windows 10 2004+ / 11). Если система не поддерживает - ничего не меняется.
ACQ_DarkTitle(hwnd) {
    global ACQ_T
    VarSetCapacity(v, 4, 0)
    NumPut(1, v, 0, "Int")
    DllCall("dwmapi\DwmSetWindowAttribute", "Ptr", hwnd, "Int", 20, "Ptr", &v, "Int", 4)
    if (IsObject(ACQ_T)) {
        NumPut(ACQ_Rgb2Bgr(ACQ_T.Panel), v, 0, "UInt")
        DllCall("dwmapi\DwmSetWindowAttribute", "Ptr", hwnd, "Int", 35, "Ptr", &v, "Int", 4)
        NumPut(ACQ_Rgb2Bgr(ACQ_T.Text), v, 0, "UInt")
        DllCall("dwmapi\DwmSetWindowAttribute", "Ptr", hwnd, "Int", 36, "Ptr", &v, "Int", 4)
    }
}

; Тёмные полосы прокрутки и заголовок колонок у ListView (по возможности)
ACQ_DarkListView(hLV) {
    DllCall("uxtheme\SetWindowTheme", "Ptr", hLV, "Str", "DarkMode_Explorer", "Ptr", 0)
    SendMessage, 0x101F, 0, 0, , ahk_id %hLV%
    hHdr := ErrorLevel
    if (hHdr != "" && hHdr != "FAIL" && hHdr != 0)
        DllCall("uxtheme\SetWindowTheme", "Ptr", hHdr, "Str", "DarkMode_ItemsView", "Ptr", 0)
}
