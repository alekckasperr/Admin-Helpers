; =====================================================================
;  Launcher.ahk - точка входа: лаунчер со всеми настройками, внутри которого работает основной скрипт.
;
;  Запуск: AutoHotkey v1.1.x (НЕ v2) -> дважды щёлкнуть Launcher.ahk, либо собрать в exe (Build.bat).
;  В exe попадают все .ahk из этой папки (main, AutoSAMP, Sp, SpecCalib, QueueGui, Theme, MiniWin, LauncherGui).
;  Лаунчер показывает окно, ждёт кнопку "Запустить скрипт" (или игру, если включён автозапуск)
;  и после этого выполняет main.ahk в этом же процессе. main.ahk по-прежнему можно запускать и отдельно.
;
;  Порядок важен: сначала лаунчер (Boot / WaitLoop / OnStart), потом #Include main.ahk, потом LauncherGui.ahk.
; =====================================================================
;@Ahk2Exe-SetName Kasperr AdminHelper
;@Ahk2Exe-SetDescription Kasperr AdminHelper
#SingleInstance, Force

LAUNCH_Boot()
LAUNCH_WaitLoop()
LAUNCH_OnStart()

#Include main.ahk
#Include LauncherGui.ahk
