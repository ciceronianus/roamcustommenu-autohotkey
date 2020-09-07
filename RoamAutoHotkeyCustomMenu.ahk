; The part of the script "Split-on-delimiter" is taken 

; Create the popup menu by adding some items to it.
Menu, MyMenu, Add, add-brackets, MenuHandler
Menu, MyMenu, Add, highlight, MenuHandler
Menu, MyMenu, Add, inline-code, MenuHandler

; Create and Handle sub-menu for Links
Menu, SubMenu-Links, Add, convert-to-md, MenuHandler
Menu, MyMenu, Add, Links, :SubMenu-Links

; Create and Handle sub-menu for Tags
Menu, SubMenu-Tags, Add ;, [name of function], MenuHandler
Menu, MyMenu, Add, Tags, :SubMenu-Tags

; Create and Handle sub-menu for Insert
Menu, SubMenu-Insert, Add, insert-Δ-character, MenuHandler
Menu, MyMenu, Add, Insert, :SubMenu-Insert

; Create and Handle sub-menu for Format
Menu, SubMenu-Format, Add ;, [name of function], MenuHandler
Menu, MyMenu, Add, Format, :SubMenu-Format

; Create and Handle sub-menu for Highlight color
Menu, SubMenu-Highlight-Color, Add ;, [name of function], MenuHandler
Menu, MyMenu, Add, Highlight color, :SubMenu-Highlight-Color

; Create and Handle sub-menu for Transformations
Menu, SubMenu-Transformations, Add ;, [name of function], MenuHandler
Menu, MyMenu, Add, Transformations, :SubMenu-Transformations

; Create and Handle sub-menu for Templates
Menu, SubMenu-Templates, Add ;, [name of function], MenuHandler
Menu, MyMenu, Add, Templates, :SubMenu-Templates

; Create and Handle sub-menu for Copy
Menu, SubMenu-Copy, Add ;, [name of function], MenuHandler
Menu, MyMenu, Add, Copy, :SubMenu-Copy



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

