//%attributes = {"shared":true,"lang":"en"}
// Project Method: wmd__mode_menu_create
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

#DECLARE($vL_mode : Integer; $vT_prefix : Text; $vT_subMenu_name : Text; $vT_refMenu : Text)->$vT_refMenu_mode : Text
var $vL_count_parameters : Integer
$vL_count_parameters:=Count parameters:C259

$vT_prefix:=($vT_prefix#"") ? $vT_prefix+"-" : $vT_prefix
var $is_toAttach : Boolean
$is_toAttach:=($vL_count_parameters>=4)


ARRAY TEXT:C222($aT_labels; 0)
APPEND TO ARRAY:C911($aT_labels; Get localized string:C991("menu_picker"))
APPEND TO ARRAY:C911($aT_labels; Get localized string:C991("menu_md_picker"))
APPEND TO ARRAY:C911($aT_labels; Get localized string:C991("menu_popup"))
APPEND TO ARRAY:C911($aT_labels; Get localized string:C991("menu_hpopup"))

var $i; $idx; $tt : Integer
var $vT_path_icons : Text
$vT_path_icons:=""
$vT_refMenu_mode:=Create menu:C408
$tt:=Size of array:C274($aT_labels)
For ($i; 1; $tt)
	$idx:=$i-1
	APPEND MENU ITEM:C411($vT_refMenu_mode; $aT_labels{$i})
	//SET MENU ITEM ICON($vT_refMenu_zoom;-1;$path_icons+$vT_zoom+".png")
	SET MENU ITEM PARAMETER:C1004($vT_refMenu_mode; -1; $vT_prefix+String:C10($idx))
	If ($idx=$vL_mode)
		SET MENU ITEM MARK:C208($vT_refMenu_mode; -1; Char:C90(18))
	End if 
End for 

If ($is_toAttach)
	APPEND MENU ITEM:C411($vT_refMenu; $vT_subMenu_name; $vT_refMenu_mode)
	RELEASE MENU:C978($vT_refMenu_mode)
End if 


