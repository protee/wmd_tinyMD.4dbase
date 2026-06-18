//%attributes = {"lang":"en","invisible":true}
// Project Method: zzzz_options_menu
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 16/04/2021   OG   Initial version.

var $is_popup; $isOk : Boolean
var $vJ_prefs : Object
wmd_initRegister()

$vJ_prefs:=wmd__storage_prefs
$is_popup:=$vJ_prefs.is_popup
$isOk:=wmd__options_menu(->$is_popup)

