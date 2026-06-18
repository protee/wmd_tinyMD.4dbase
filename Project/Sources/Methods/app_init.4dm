//%attributes = {"invisible":true,"lang":"en"}
// *****
// *
// Method: app_init
// Olivier Grimbert — Protée sarl — 16/08/2024 19:11:44
//
// Description: 
//
// Date       | Who | Comment
// 16/08/2024 | OG  | Updated
// *
// *****

var $vJ_prefs : Object
var $cs__wox_menu : cs:C1710._wox_menu
$vJ_prefs:=wmd__storage_prefs

Use ($vJ_prefs)
	$vJ_prefs.t_name:="wmd_tinyMD"
	$vJ_prefs.t_app:="wmd"  // For ogMake also ↴
	$vJ_prefs.t_version:="21.0.00"
	$vJ_prefs.fo_rsc:=Folder:C1567(fk resources folder:K87:11)
	$vJ_prefs.is_free:=True:C214  // Always displays licensed ogKrolific
	
	$cs__wox_menu:=cs:C1710._wox_menu.new()  // A "kind" of singleton !!
	$vJ_prefs.cs_wox_menu:=OB Copy:C1225($cs__wox_menu; ck shared:K85:29; $vJ_prefs)
	
	// For ogMake only ↴
	$vJ_prefs.l_make:=1
	$vJ_prefs.t_host_name:=""
	$vJ_prefs.fu_callback_init:=Formula:C1597(_wom_callback_init)
	//$vJ_prefs.fu_callback_built:=Formula(_wom_callback_built)
	
	$vJ_prefs.l_top:=130  // Begin for all windows
	
End use 

