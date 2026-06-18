//%attributes = {"shared":true,"lang":"en"}
// *****
// *
// Method: wmd_initRegister
// Olivier Grimbert — Protée sarl — 16/08/2024 22:46:36
//
// Description:
//
// Date       | Who | Comment
// 01/03/2021 | OG  | Initial version.
// 16/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vT_host_name : Text; $vT_serial : Text; $is_send : Boolean)->$is_serial_ok : Boolean
var $is_wok_Krolific; $is_initialization; $isOk : Boolean
var $vJ_prefs : Object


// ***** MANAGE WOK for registration if exists
// *
wok_init()
wox_initRegister()
// *
// *****

$vJ_prefs:=wmd__storage_prefs

// ***** FIRST INITIALIZE
// *
$is_initialization:=($vJ_prefs=Null:C1517) || Shift down:C543
If ($is_initialization)
	
	$vJ_prefs:=New shared object:C1526
	Use (Storage:C1525)
		Storage:C1525.j_prefs:=$vJ_prefs
	End use 
	app_init
	app_init_prefs
	app_init_widgets
	app_init_stuff
	app_init_space_md
End if 
// *
// *****


// ***** THEN REGISTRATION TO WOK
// *
$isOk:=wok_license_register($vJ_prefs; $vT_host_name; $vT_serial)
// *
// *****

