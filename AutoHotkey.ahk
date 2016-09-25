;;
;; AutoHotKey script and snippets
;;
;; CTRL  = ^
;; SHIFT = +
;; ALT   = !
;; WIN   = #
;; RWIN, LWIN, <^, >^
;;

;; To do: --------------------------------------
;; - run backups
;; - run anti-virus
;; - check sizes, directories, comparisons, etc.
;; - check logs
;; - hacking desktop (4 windows) 1, cmd.exe, 2, irc, 3, browser, 4, who
;; - programmer desktop 1, ide, 2, cmd 3, browser
;; - script to find all important config files and check into git
;;

+Capslock::Capslock
Capslock::Ctrl



;; Ctrl+Shift+O to open containing folder in Explorer.
;; Ctrl+Shift+E to open folder with current file selected.
;; Supports SciTE and Notepad++.
;; ^+o::
;; ^+e::
;;    editor_open_folder() {
;;        WinGetTitle, path, A
;;        if RegExMatch(path, "\*?\K(.*)\\[^\\]+(?= [-*] )", path)
;;            if (FileExist(path) && A_ThisHotkey = "^+e")
;;                Run explorer.exe /select`,"%path%"
;;            else
;;                Run explorer.exe "%path1%"
;;    }

;; Fix broken keyboard -------------------------

Fix() {
	;;    sleep, 300
	;;    key := SubStr(A_ThisHotkey,2)
	;;    Send {Blind}%key%
	;;    KeyWait, %key%
	;;    if (A_ThisHotkey != A_PriorHotkey || A_TimeSincePriorHotkey > 400)
	;;        Send % "{Blind}" SubStr(A_ThisHotkey,2)
	Return
}

#v::
    Run "D:\vim74\vim74\gvim.exe"
    ;;Run "D:\vim8\gvim.exe"
    return
    
;; Razor Keyboard ------------------------------
;;
;; #IfWinActive

!+e::
	Process,Close,MicrosoftEdge.exe
	return

#q::
	MsgBox "Dashboard of Network response - Task Mgr, Wifi, services, load"
	return

#`::

    return

#s::
;; sync
    Run "C:\Program Files (x86)\2BrightSparks\SyncBackPro\SyncBackPro.exe"
    return

;; ^`::
;;	Run F:\ConEMU64\ConEMU64.exe
;;	return

;; Lock Screen
;; ^Esc::

^`::
    SendInput, {LWin Down}d{LWin Up}
    SendInput, {LWin Down}l{LWin Up}
    return

;; <^Space::
	;;SendInput, {RWin Down}s{RWin Up}
	;;Runs "everything.exe"
	;;return

;;#Space::
	;;MsgBox "Hi"
	;;Run F:\grepWin\grepWin-x64-1.6.12_portable.exe
	;;return

;;^B::
	;; Builds
	;;return

;; M1
;;^!F5::
;;  Mapped inside Everything.exe
;;  return

;; M2
^!F6::
	;; C:\Program Files\dnGREP\dnGREP.exe
    ;; Run "F:\Grep\grepWin\grepWin-x64-1.6.12_portable.exe"
    Run "F:\Grep\AstroGrep\AstroGrep.exe"
    return

;; M3
^!F7::
    url="www.google.com"
    run % "chrome.exe" ( winExist("ahk_class Chrome_WidgetWin_1") ? " --new-window " : " " ) url
    WinMaximize A
	return

;; M4
^!F8::
    url="kat.cr"
    run % "chrome.exe" ( winExist("ahk_class Chrome_WidgetWin_1") ? " --new-window " : " " ) url
    WinMaximize A
	return

;; M5
^!F9::
	; Grab your Todolist, prevent running during kids playtime
	; 1=Sunday, 2=Monday,...

	Formattime, dayOfToday,, WDay        ; Get number of todays day

	Msgbox %dayOfToday%

	if (dayOfToday == 7) { ; saturday
		return
	}
	if (dayOfToday == 1) {
		return
	}
	if (dayOfToday == 6) { ; friday
		return
	}

	Run "d:\vim72\gvim.exe" "F:\Dropbox\todo-list\todo.txt"
	;; Run "F:\Program Files\Just Great Software\EditPad Lite 7\EditPadLite7.exe" "F:\Dropbox\todo-list\todo.txt"

	return


;; Windows Key + M1, 2, 3, 4, 5
;; ` + M1, 2, 3, 4, 5               

#^!F5::
    Run F:\ConEMU64\ConEMU64.exe
    return

#^!F6::
    ;; Run "explorer.exe %USERPROFILE%"
    ;; userdir = %USERPROFILE%
    Run, explore c:\Users\gcraig
    Sleep 2500
    Send, ^+4
    return

#^!F7::
    Run F:\Salamander\salamand.exe
    return

;;
;; Drives ----------------------------------------
;;

^!c::Run, explorer c:
            return ; Ctrl+Alt+c becomes a hotkey for Drive C:
^!d::Run, explorer d:
            return ; Ctrl+Alt+d becomes a hotkey for Drive D:
^!e::Run, explorer e:
            return ; Ctrl+Alt+e becomes a hotkey for Drive E:
^!f::Run, explorer f:
            return ; Ctrl+Alt+f becomes a hotkey for Drive F:
^!g::Run, explorer g:
            return ; Ctrl+Alt+g becomes a hotkey for Drive G:

;; {c}{RButton}::Run, explorer c:
;;        return ; Ctrl+Alt+c becomes a hotkey for Drive C:


;;
;; Temp Commands -----------------------------------
;;

;;^`::
	;;Run F:\Cmder.exe
    ;;Run cmd.exe
	;;return
    
^!b::
    Run "F:\Git\git-bash.exe"
	return

^!u::
    ;; Run "C:\Program Files\Git\cmd\git-gui.exe"
    ;; git config --global user.name
    Run F:\GitEye-1.12.0-windows.x86_64\GitEye.exe
    return
    
^!v::
	Run "D:\vim72\gvim.exe"
	return

^!w::
    Run F:\wamp\wampmanager.exe
    return

;;^!p::
;;    Run F:\php 
;;    return


;;#h::
;;	Run "D:\EditPlus\editplus.exe"
;;	return

;;
;; Number pad --------------------
;;


;; reload ---------------------------------

#Numpad7:: ;press control+number pad 7 to reload9
    SplashTextOn,,, Reloading ...
    Sleep 3000
    SplashTextOff
  ;;Msgbox, Do you really want to reload this script?
  ;;ifMsgBox, Yes
    Reload
  return

;; ---------------------------------------

;; scite
;; lamp, wamp
;; repair tools
;; anti-virus, backup, defense system check
;; encryption

^Numpad1:: ;javascript, python, sql developer
	;;SplashTextOn,,, javascript developer
    ;;Sleep 300
    ;;SplashTextOff
    ;;Run cmd /c F:\Python27\python.exe F:\Python27\Lib\idlelib\idle.py
    ;;Run cmd /c F:\templates\StackWindows.vbs
	;;MsgBox The backup process has completed.
    ;;Run cmd /c F:\Nodejs\node.exe
    Run, F:\WebStorm-10.0.1\bin\WebStorm.exe
    return

^Numpad2:: ;python developer
    ;;Run cmd /c F:\Python27\python.exe
    MsgBox "IPython Notebooks?"
    Run, F:\PyCharm-4.0.6\bin\pycharm64.exe
    return

^Numpad3:: ;java / groovy
    Run, D:\ideaIU-2016.1.3\bin\idea64.exe
    ;;Run, D:\ideaIU-14.1.4\bin\idea64.exe
    return

^Numpad4:: ;
    Run, F:\SciTE\SciTE.exe
    return

^Numpad5:: ;
^!n::
	Run, "C:\Program Files (x86)\Evernote\Evernote\EverNote.exe"
    return

^Numpad6::
    ;;Run, "Index Cards Program"
    Run D:\NetBeans-8.1\bin\netbeans64.exe
    return

^Numpad7::
    ;;Run F:\ConEMU64\ConEMU64.exe
    Run D:\Console\console.exe
	return

^Numpad8::
    Run D:\vim72\gvim.exe
    return
    
^Numpad9:: ;java / groovy
    Run C:\Users\gcraig\AppData\Local\Apps\2.0\7Z2C74DJ.JND\ZR2XGV35.322\gith..tion_317444273a93ac29_0003.0003_92b520eb113e6614\Github.exe
    return    

;; REPLs
;; Node
;; Python
;; Ruby? IPython? Scripting ...

;; Protection

;;^Numpad7::
;;    MsgBox "Running Mirror, Backups, Creating Restore Point"
;;    return

;;^Numpad8::
;;    MsgBox "Running Anti-Virus, Anti-Malware"
;;    return

;;^Numpad9::
;;    Run "F:\SystemExplorer\SystemExplorer.exe"
;;    Sleep 2500
;;    Send, #{Right}
;;    return

;;^Numpad8::
    ;;Run "D:\vim72\gvim.exe" "f:\templates\html5.template"
    ;;return

;;^Numpad9:: ;java developer
    ;;Run cmd /c c:\file.ahk "param1"
    ;;Run cmd /c F:\templates\StackWindows.vbs
    ;;return


!Numpad7:: ;Torrents-Downloads
	Run, "F:\Torrents-Downloads"
	return

;; vim
;; sublime
;; scite
;; notepad++


;;
;; Expansions ------------------
;;

;;^!s::  ; Ctrl+Alt+S becomes a hotkey to type a signature:
;;Send Sincerely,{Enter}George Craig
;;return

::btw::by the way  ; expands to "by the way" when "btw" is typed


;;
;; Builds ----------------------
;; macros so that builds are always the same

;;
;; Templates -------------------
;; Snippets

;;
;; Locations -------------------
;;

#m::Run "F:\Mega"


;; Notes -----------------------

;; ctrl+alt+up Changes first character of word to capital

;; script that auto syncs profiles on windows 7 & 8  and paths / classpaths
;; dexpot
;; unison vs robocopy
;;
;; git commit?
;; git merge?
;; github publish
;; rename
;; robocopy
;;
;; _vimrc
;; autohotkey
;; image publishing tools

;;^Numpad0::
;;	div
;;^Numpad0::
;;	table




;; Antivirus Protection Detection
;; F:\SystemExplorer\SystemExplorer.exe
;; AVG


;------------------------------------------------------------------------------------------------------------------


#if winactive("ahk_class vim.exe")
f5::
{
    wingettitle, title
    dir := substr(title, instr(title, "(") + 1, instr(title, ")") - instr(title,"(") - 1)
    file := substr(title, 1, instr(title, ".ahk"))
    run, % "Autohotkey.exe """ dir "\" file "ahk"""
    return
}
f1::
{
    oldClip := clipboard
    send {esc}
    sleep 50
    send ebyw
    sleep 50
    searchWord := clipboard
    clipboard := oldClip
    if(! winexist("ahk_class HH Parent"))
    {
        run, hh.exe %A_programfiles%\autohotkey\autohotkey.chm
        winwait, ahk_class HH Parent
    }
    ControlSetText, Edit1, %searchWord%, ahk_class HH Parent
    controlsend, Edit1, {enter}, ahk_class HH Parent
    winactivate, ahk_class HH Parent
    ;I don't normally need to have the help file activated
    winactivate, ahk_class Vim
    return
}
+f5::
{
    MsgBox "Execute"
    wingettitle, title
    dir := substr(title, instr(title, "(") + 1, instr(title, ")") - instr(title,"(") - 1)
    run, % dir
    return
}
#if



;------------------------------------------------------------------------------------------------------------------


Morse(timeout = 400) { ;
   tout := timeout/1000
   key := RegExReplace(A_ThisHotKey,"[\*\~\$\#\+\!\^]")
   Loop {
      t := A_TickCount
      KeyWait %key%
      Pattern .= A_TickCount-t > timeout
      KeyWait %key%,DT%tout%
      If (ErrorLevel)
         Return Pattern
   }
}

;;BS::MsgBox % "Morse press pattern " Morse()

Capslock::
   p := Morse()
   If (p = "0")
      MsgBox Short press
   Else If (p = "00")
      MsgBox Two short presses
   Else If (p = "01")
      MsgBox Short+Long press
   Else
      MsgBox Press pattern %p%
Return


;------------------------------------------------------------------------------------------------------------------

;Copy selected text to new note in evernote - move to 'Inbox' notebook.

;Ctrl + Windows Key + N



^#n::

Send ^c ; copy to clipboard

ClipWait

Send ^!n ;open evernote

Sleep 1500

Send ^v ;paste note



Sleep 300

Send !n v

Sleep 300

Send Inbox

Sleep 200

Send {Enter} {Enter} {F3} ;Move to 'Inbox' notebook

Sleep 100

Send {Enter} ; Confirm move to notebook

Sleep 100

Send {F3} ; Confirm move to notebook

Sleep 100 ;

Reload

Sleep 200 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.

return

;------------------------------------------------------------------------------------------------------------------
