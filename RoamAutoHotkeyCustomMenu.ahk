; The part of the script "Split-on-delimiter" is taken 

; Create the popup menu by adding some items to it.
Menu, MyMenu, Add, add-brackets, MenuHandler
Menu, MyMenu, Add, highlight, MenuHandler
Menu, MyMenu, Add, inline-code, MenuHandler
Menu, MyMenu, Add, convert-to-md, MenuHandler
Menu, MyMenu, Add, insert-Δ-character, MenuHandler



return 



MenuHandler:
 Sleep 100
 Switch A_ThisMenuItem
 {
   Case "add-brackets":
    	Send ^x 
         Sleep 100
	clipboard := "[[" clipboard "]]"   ; Append some text to the clipboard.
     Sleep 100
	Send ^v

     Case "highlight":
    	Send ^x 
         Sleep 100
	clipboard := "^^" clipboard "^^"   ; Append some text to the clipboard.
     Sleep 100
	Send ^v	

     Case "inline-code":
    	Send ^x 
         Sleep 100
	clipboard := "``" clipboard "``"   ; Append some text to the clipboard.
     Sleep 100
	Send ^v

     Case "convert-to-md":
    	Send ^x 
         Sleep 100
	
     url:= ""
     tile:= ""
     Sleep 100
     If InStr(clipboard, "http")
          RegExMatch(clipboard, "(http[^ ]*)", url)
          ; MsgBox % url
     Sleep 100
     title := StrReplace(clipboard, url,"")

     Sleep 100
     title := RegExReplace(title,"([ -]*)$","")
     title := RegExReplace(title,"(^[ -]*)","")
     Sleep 100
     clipboard := "[" title "](" url ")"
     Sleep 100
     
     Send ^v

     Case "insert-Δ-character":
     Send ∆

    


     
 }
return

MenuAddBrackets:


Control & RButton::Menu, MyMenu, Show  ; i.e. press the Win-Z hotkey to show the menu.

