buildscr = 110167
Utf8ToAnsi(ByRef Utf8String, CodePage = 1251)
{
If (NumGet(Utf8String) & 0xFFFFFF) = 0xBFBBEF
BOM = 3
Else
BOM = 0
UniSize := DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
, "UInt", &Utf8String + BOM, "Int", -1
, "Int", 0, "Int", 0)
VarSetCapacity(UniBuf, UniSize * 2)
DllCall("MultiByteToWideChar", "UInt", 65001, "UInt", 0
, "UInt", &Utf8String + BOM, "Int", -1
, "UInt", &UniBuf, "Int", UniSize)
AnsiSize := DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
, "UInt", &UniBuf, "Int", -1
, "Int", 0, "Int", 0
, "Int", 0, "Int", 0)
VarSetCapacity(AnsiString, AnsiSize)
DllCall("WideCharToMultiByte", "UInt", CodePage, "UInt", 0
, "UInt", &UniBuf, "Int", -1
, "Str", AnsiString, "Int", AnsiSize
, "Int", 0, "Int", 0)
Return AnsiString
}



global dwAGG := 0x0
global hGTA := 0x0
global dwGTAPID := 0x0
global dwSAMP := 0x0
global pMemory := 0x0
global pParam1 := 0x0
global pParam2 := 0x0
global pParam3 := 0x0
global pParam4 := 0x0
global pParam5 := 0x0
global pInjectFunc := 0x0
global iRefreshHandles := 0
global GAME_MP_ModuleAggmain := "aggmain.asi"
global GAME_MP_ModuleName := "azmp.dll"
global GAME_PID := "AMAZING ONLINE"

; --- Смещение "ID игрока в спеке" внутри aggmain.asi ---
; После обновления игры оно меняется. Новое значение находится
; калибровкой (Ctrl+Alt+F9, см. SpecCalib.ahk) и хранится в offsets.ini
global SPEC_ID_OFFSET := 0x1168158
IniRead, _so, %A_ScriptDir%\offsets.ini, aggmain, SpecIdOffset, 0
if (_so)
    SPEC_ID_OFFSET := _so + 0



waitForSingleObject(hThread, dwMilliseconds) {
if (!hThread) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
dwRet := DllCall("WaitForSingleObject", "UInt", hThread, "UInt", dwMilliseconds, "UInt")
if (dwRet == 0xFFFFFFFF) {
ErrorLevel := ERROR_WAIT_FOR_OBJECT
return 0
}
ErrorLevel := ERROR_OK
return dwRet
}
createRemoteThread(hProcess, lpThreadAttributes, dwStackSize, lpStartAddress, lpParameter, dwCreationFlags, lpThreadId) {
if (!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
dwRet := DllCall("CreateRemoteThread", "UInt", hProcess, "UInt", lpThreadAttributes, "UInt", dwStackSize, "UInt", lpStartAddress, "UInt", lpParameter, "UInt", dwCreationFlags, "UInt", lpThreadId, "UInt")
if (dwRet == 0) {
ErrorLevel := ERROR_ALLOC_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return dwRet
}
virtualFreeEx(hProcess, lpAddress, dwSize, dwFreeType) {
if (!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
dwRet := DllCall("VirtualFreeEx", "UInt", hProcess, "UInt", lpAddress, "UInt", dwSize, "UInt", dwFreeType, "UInt")
if (dwRet == 0) {
ErrorLevel := ERROR_FREE_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return dwRet
}
virtualAllocEx(hProcess, dwSize, flAllocationType, flProtect) {
if (!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
dwRet := DllCall("VirtualAllocEx", "UInt", hProcess, "UInt", 0, "UInt", dwSize, "UInt", flAllocationType, "UInt", flProtect, "UInt")
if (dwRet == 0) {
ErrorLevel := ERROR_ALLOC_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return dwRet
}
callWithParams(hProcess, dwFunc, aParams, bCleanupStack = true, thiscall = false) {
if (!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return false
}
validParams := 0
i := aParams.MaxIndex()
dwLen := i * 5 + 5 + 1
if (bCleanupStack)
dwLen += 3
VarSetCapacity(injectData, i * 5 + 5 + 3 + 1, 0)
i_ := 1
while(i > 0) {
if (aParams[i][1] != "") {
dwMemAddress := 0x0
if (aParams[i][1] == "p") {
dwMemAddress := aParams[i][2]
} else if (aParams[i][1] == "s") {
if (i_>3)
return false
dwMemAddress := pParam%i_%
writeString(hProcess, dwMemAddress, aParams[i][2])
if (ErrorLevel)
return false
i_ += 1
} else if (aParams[i][1] == "i") {
dwMemAddress := aParams[i][2]
} else {
return false
}
NumPut((thiscall && i == 1 ? 0xB9 : 0x68), injectData, validParams * 5, "UChar")
NumPut(dwMemAddress, injectData, validParams * 5 + 1, "UInt")
validParams += 1
}
i -= 1
}
offset := dwFunc - ( pInjectFunc + validParams * 5 + 5 )
NumPut(0xE8, injectData, validParams * 5, "UChar")
NumPut(offset, injectData, validParams * 5 + 1, "Int")
if (bCleanupStack) {
NumPut(0xC483, injectData, validParams * 5 + 5, "UShort")
NumPut(validParams*4, injectData, validParams * 5 + 7, "UChar")
NumPut(0xC3, injectData, validParams * 5 + 8, "UChar")
} else {
NumPut(0xC3, injectData, validParams * 5 + 5, "UChar")
}
writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
if (ErrorLevel)
return false
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
if (ErrorLevel)
return false
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
return true
}
writeRaw(hProcess, dwAddress, pBuffer, dwLen) {
if (!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return false
}
dwRet := DllCall("WriteProcessMemory", "UInt", hProcess, "UInt", dwAddress, "UInt", pBuffer, "UInt", dwLen, "UInt", 0, "UInt")
if (dwRet == 0) {
ErrorLevel := ERROR_WRITE_MEMORY
return false
}
ErrorLevel := ERROR_OK
return true
}
writeString(hProcess, dwAddress, wString) {
if (!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return false
}
sString := wString
if (A_IsUnicode)
sString := __unicodeToAnsi(wString)
dwRet := DllCall("WriteProcessMemory", "UInt", hProcess, "UInt", dwAddress, "Str", sString, "UInt", StrLen(wString) + 1, "UInt", 0, "UInt")
if (dwRet == 0) {
ErrorLevel := ERROR_WRITE_MEMORY
return false
}
ErrorLevel := ERROR_OK
return true
}
readDWORD(hProcess, dwAddress) {
if (!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
VarSetCapacity(dwRead, 4)
dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress, "Str", dwRead, "UInt", 4, "UInt*", 0)
if (dwRet == 0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return NumGet(dwRead, 0, "UInt")
}
getModuleBaseAddress(sModule, hProcess) {
if (!sModule) {
ErrorLevel := ERROR_MODULE_NOT_FOUND
return 0
}
if (!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
dwSize = 1024*4
VarSetCapacity(hMods, dwSize)
VarSetCapacity(cbNeeded, 4)
dwRet := DllCall("Psapi.dll\EnumProcessModules", "UInt", hProcess, "UInt", &hMods, "UInt", dwSize, "UInt*", cbNeeded, "UInt")
if (dwRet == 0) {
ErrorLevel := ERROR_ENUM_PROCESS_MODULES
return 0
}
dwMods := cbNeeded / 4
i := 0
VarSetCapacity(hModule, 4)
VarSetCapacity(sCurModule, 260)
while(i < dwMods) {
hModule := NumGet(hMods, i*4)
DllCall("Psapi.dll\GetModuleFileNameEx", 	"UInt", hProcess, 	"UInt", hModule, 	"Str", sCurModule, 	"UInt", 260)
SplitPath, sCurModule, sFilename
if (sModule == sFilename) {
ErrorLevel := ERROR_OK
return hModule
}
i := i + 1
}
ErrorLevel := ERROR_MODULE_NOT_FOUND
return 0
}
closeProcess(hProcess) {
if (hProcess == 0) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}
dwRet := DllCall("CloseHandle", "Uint", hProcess, "UInt")
ErrorLevel := ERROR_OK
}
openProcess(dwPID, dwRights = 0x1F0FFF) {
hProcess := DllCall("OpenProcess", "UInt", dwRights, "int",  0, "UInt", dwPID, "Uint")
if (hProcess == 0) {
ErrorLevel := ERROR_OPEN_PROCESS
return 0
}
ErrorLevel := ERROR_OK
return hProcess
}
getPID(szWindow) {
local dwPID := 0
WinGet, dwPID, PID, %szWindow%
return dwPID
}
refreshMemory() {
if (!pMemory) {
pMemory	 := virtualAllocEx(hGTA, 6144, 0x1000 | 0x2000, 0x40)
if (ErrorLevel) {
pMemory := 0x0
return false
}
pParam1	:= pMemory
pParam2	:= pMemory + 1024
pParam3 := pMemory + 2048
pParam4	:= pMemory + 3072
pParam5	:= pMemory + 4096
pInjectFunc := pMemory + 5120
}
return true
}
refreshSAMP() {
if (dwSAMP)
return true
dwSAMP := getModuleBaseAddress(GAME_MP_ModuleName, hGTA)
if (!dwSAMP) return false
return true
}
refreshAggMain() {
if (dwAGG)
return true
dwAGG := getModuleBaseAddress(GAME_MP_ModuleAggmain, hGTA)
if (!dwAGG) return false
return true
}
refreshGTA() {
newPID := getPID(GAME_PID)
if (!newPID) {
if (hGTA) {
virtualFreeEx(hGTA, pMemory, 0, 0x8000)
closeProcess(hGTA)
hGTA := 0x0
}
dwGTAPID := 0
hGTA := 0x0
dwSAMP := 0x0
pMemory := 0x0
dwAGG := 0x0
return false
}
if (!hGTA || (dwGTAPID != newPID)) {
hGTA := openProcess(newPID)
if (ErrorLevel) {
dwGTAPID := 0
hGTA := 0x0
dwSAMP := 0x0
pMemory := 0x0
return false
}
dwGTAPID := newPID
dwSAMP := 0x0
pMemory := 0x0
return true
}
return true
}

checkHandles() {
if (iRefreshHandles+500>A_TickCount)
return true
iRefreshHandles:=A_TickCount
return (refreshGTA() && refreshSAMP() && refreshMemory() && refreshAggMain())
}

HexToDec(str) {
local newStr := ""
static comp := {0:0, 1:1, 2:2, 3:3, 4:4, 5:5, 6:6, 7:7, 8:8, 9:9, "a":10, "b":11, "c":12, "d":13, "e":14, "f":15}
StringLower, str, str
str := RegExReplace(str, "^0x|[^a-f0-9]+", "")
Loop, % StrLen(str)
newStr .= SubStr(str, (StrLen(str)-A_Index)+1, 1)
newStr := StrSplit(newStr, "")
local ret := 0
for i,char in newStr
ret += comp[char]*(16**(i-1))
return ret
}

__unicodeToAnsi(wString, nLen = 0) {
pString := wString + 1 > 65536 ? wString : &wString
if (!nLen) {
nLen := DllCall("WideCharToMultiByte", "Uint", 0, "Uint", 0, "Uint", pString, "int",  -1, "Uint", 0, "int",  0, "Uint", 0, "Uint", 0)
}
VarSetCapacity(sString, nLen)
DllCall("WideCharToMultiByte", "Uint", 0, "Uint", 0, "Uint", pString, "int",  -1, "str",  sString, "int",  nLen, "Uint", 0, "Uint", 0)
return sString
}

sendChat(Text) {
if (!checkHandles())
return -1
dwFunc := 0
if (SubStr(Text, 1, 1) == "/") {
dwFunc := dwSAMP + 0x69190
} else {
dwFunc := dwSAMP + 0x5820
}

callWithParams(hGTA, dwFunc, [["s", "" Text]], false)
}
sendNewChat(Text) {
SendMessage, 0x50,, 0x4190419,, A
SendInput,{F6}
sleep 50
SendInput,%Text%{Enter}
sleep 200
}

getPlayerSkinId() {
if (!checkHandles())
return -1
return readMem(hGTA, readDWORD(hGTA, 0xB6F5F0) + 0x22, 2, "byte")
}

getSpID() {
    loadInGame()
    if (!checkHandles())
        return -1
    return readDWORD(hGTA, dwAGG + SPEC_ID_OFFSET)
}

; "Отпечаток" текущей версии aggmain.asi (время сборки + размер образа)
SpecModuleStamp() {
    global hGTA, dwAGG
    if (!hGTA || !dwAGG)
        return ""
    peOff := readDWORD(hGTA, dwAGG + 0x3C)
    if (peOff < 0x40 || peOff > 0x1000)
        return ""
    return Format("{:X}-{:X}", readDWORD(hGTA, dwAGG + peOff + 8), readDWORD(hGTA, dwAGG + peOff + 0x50))
}

; true, если смещение откалибровано именно под ту версию aggmain.asi, что запущена сейчас
SpecIdTrusted() {
    if (!checkHandles())
        return false
    IniRead, saved, %A_ScriptDir%\offsets.ini, aggmain, Stamp, NONE
    return (saved != "NONE" && saved = SpecModuleStamp())
}

loadInGame() {
return checkHandles()
}

getPlayerId() {
loadInGame()
if (!checkHandles())
return -1
char := readDWORD(hGTA, dwAGG + 0x94A899EC)
return readDWORD(hGTA, dwAGG + 0x94A899EC)
}

readMem(hProcess, dwAddress, dwLen=4, type="UInt") {
if (!hProcess) {
ErrorLevel := ERROR_INVALID_HANDLE
return 0
}

VarSetCapacity(dwRead, dwLen)
dwRet := DllCall("ReadProcessMemory", "UInt", hProcess, "UInt", dwAddress, "Str", dwRead, "UInt", dwLen, "UInt*", 0)
if (dwRet == 0) {
ErrorLevel := ERROR_READ_MEMORY
return 0
}
ErrorLevel := ERROR_OK
return NumGet(dwRead, 0, type)
}

isInChat() {
if (!checkHandles())
return -1
return (readDWORD(hGTA, readDWORD(hGTA, dwSAMP + 0x26E8F4) + 0x61) > 0)
}

addChatMessageEx(Color, Text) {
if (!checkHandles())
return -1
VarSetCapacity(data2, 4, 0)
NumPut(HexToDec(Color), data2, 0, "Int")
dwAddress := readDWORD(hGTA, dwSAMP + 0x26E8C8)
VarSetCapacity(data1, 4, 0)
NumPut(readDWORD(hGTA, dwAddress + 0x4), data1, 0, "Int")
WriteRaw(hGTA, dwAddress + 0x4, &data2, 4)
callWithParams(hGTA, dwSAMP + 0x67970, [["p", readDWORD(hGTA, dwSAMP + 0x26E8C8)], ["s", "" Text]], true)
WriteRaw(hGTA, dwAddress + 0x4, &data1, 4)
}

showDialog(style, caption, text, button1, button2 := "", id := 1) {
style += 0
style := Floor(style)
id += 0
id := Floor(id)
caption := "" caption
text := "" text
button1 := "" button1
button2 := "" button2
if (id < 0 || id > 32767 || style < 0 || style > 5 || StrLen(caption) > 64 || StrLen(text) > 4096 || StrLen(button1) > 10 || StrLen(button2) > 10)
return false
if (!checkHandles())
return -1
dwFunc := dwSAMP + 0x6F8C0
sleep 200
dwAddress := readDWORD(hGTA, dwSAMP + 0x26E898)
if (!dwAddress) {
return -1
}
writeString(hGTA, pParam5, caption)
writeString(hGTA, pParam1, text)
writeString(hGTA, pParam5 + 512, button1)
writeString(hGTA, pParam5+StrLen(caption) + 1, button2)
dwLen := 5 + 7 * 5 + 5 + 1
VarSetCapacity(injectData, dwLen, 0)
NumPut(0xB9, injectData, 0, "UChar")
NumPut(dwAddress, injectData, 1, "UInt")
NumPut(0x68, injectData, 5, "UChar")
NumPut(1, injectData, 6, "UInt")
NumPut(0x68, injectData, 10, "UChar")
NumPut(pParam5 + StrLen(caption) + 1, injectData, 11, "UInt")
NumPut(0x68, injectData, 15, "UChar")
NumPut(pParam5 + 512, injectData, 16, "UInt")
NumPut(0x68, injectData, 20, "UChar")
NumPut(pParam1, injectData, 21, "UInt")
NumPut(0x68, injectData, 25, "UChar")
NumPut(pParam5, injectData, 26, "UInt")
NumPut(0x68, injectData, 30, "UChar")
NumPut(style, injectData, 31, "UInt")
NumPut(0x68, injectData, 35, "UChar")
NumPut(id, injectData, 36, "UInt")
NumPut(0xE8, injectData, 40, "UChar")
offset := dwFunc - (pInjectFunc + 45)
NumPut(offset, injectData, 41, "Int")
NumPut(0xC3, injectData, 45, "UChar")
writeRaw(hGTA, pInjectFunc, &injectData, dwLen)
hThread := createRemoteThread(hGTA, 0, 0, pInjectFunc, 0, 0, 0)
waitForSingleObject(hThread, 0xFFFFFFFF)
closeProcess(hThread)
}