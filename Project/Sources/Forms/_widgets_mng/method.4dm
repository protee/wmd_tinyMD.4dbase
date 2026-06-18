
var $isOk : Boolean
var $vL_event_code : Integer
var $vJ_formEvent : Object
var $vT_objectName : Text
$vJ_formEvent:=FORM Event:C1606
$vL_event_code:=$vJ_formEvent.code
$vT_objectName:=$vJ_formEvent.objectName

Case of 
		
	: ($vL_event_code=On Load:K2:1)
		$isOk:=wox_prefs_windows_load()
		
		
	: ($vL_event_code=On Close Box:K2:21)
		CANCEL:C270
		
		
	: ($vL_event_code=On Unload:K2:2)
		wox_prefs_windows_save()
		
		
End case 

