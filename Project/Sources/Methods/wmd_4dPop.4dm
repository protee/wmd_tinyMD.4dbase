//%attributes = {"shared":true,"lang":"en"}
// Project Method: woc_4DPop
//
// Parameter Type Description
// $1 PTR for compatibility only
//
// Description:
// 4DPop access
//
// Date        Init  Description
// ===================================================================
// 01/03/2021   OG   Initial version.

#DECLARE($vP_4DPop : Pointer)  //For 4DPop compatibility
var $isOk : Boolean
var $vC_aj_menu; $vC_at_menu : Collection
var $vT_subPath_icon; $vT_menu : Text
var $vJ_prefs : Object

wmd_initRegister()  // Licence key
$vJ_prefs:=wmd__storage_prefs()

$vT_menu:=""
$vT_subPath_icon:="main/icn_"
$vC_aj_menu:=x_4dPop_get_menu_vC()
$isOk:=x_4dPop_menu(On Clicked:K2:4; ->$vT_menu; $vT_subPath_icon; $vC_aj_menu; $vJ_prefs)
If ($isOk)
	$vC_at_menu:=Split string:C1554($vT_menu; ".")
	x_4Dpop_execute($vC_at_menu)
End if 

