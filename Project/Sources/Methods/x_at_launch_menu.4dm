//%attributes = {"lang":"en"}

#DECLARE($vT_prefix : Text; $vT_header : Text; $vC_at_menu : Collection; $vT_refMenu : Text; $is_inline : Boolean)->$vT_refMenu_answer : Text
var $is_toAttach : Boolean
var $idx : Integer
var $vJ_prefs : Object
var $vT_app; $vT_subPath_icon; $vT_menu; $vT_icon; $vT_translated : Text
var $vT_path_menu : Text
$is_toAttach:=($vT_refMenu#"")

//If ($is_toAttach) && ($is_inline)
//$vT_refMenu_answer:=$vT_refMenu
//Else 
//$vT_refMenu_answer:=Create menu
//If (Not($is_toAttach))
//x_header_menu($vT_refMenu_answer; $vT_header)
//End if 
//End if 

$vJ_prefs:=wmd__storage_prefs()
$vT_app:=$vJ_prefs.t_app
//$vT_header:=$vT_header#"" ? $vT_header : x_get_localized(k_rsct_menu; $vT_app+"_actions")
$vT_header:=$vT_header#"" ? $vT_header : $vT_app+"_actions"
$vT_refMenu_answer:=$is_toAttach && $is_inline ? $vT_refMenu : Create menu:C408()
x_header_menu($vT_refMenu_answer; $vT_header)

$vT_subPath_icon:="main/icn_"
$vT_path_menu:="path:/RESOURCES/"+$vT_subPath_icon

$idx:=0
For each ($vT_menu; $vC_at_menu)
	If ($vT_menu="")
		APPEND MENU ITEM:C411($vT_refMenu_answer; "-")
	Else 
		$vT_icon:=$vT_menu
		//$vT_translated:=x_get_localized(k_rsct_menu; $vT_app+"_"+$vT_menu)
		$vT_translated:=$vT_app+"_"+$vT_menu
		APPEND MENU ITEM:C411($vT_refMenu_answer; $vT_translated; *)
		SET MENU ITEM PARAMETER:C1004($vT_refMenu_answer; -1; $vT_prefix+$vT_menu)
		SET MENU ITEM ICON:C984($vT_refMenu_answer; -1; $vT_path_menu+$vT_icon+k_png_ext)
		$idx+=1
	End if 
End for each 

If ($is_toAttach) && (Not:C34($is_inline))
	$vT_icon:="launch"
	$vT_path_menu:="path:/RESOURCES/icons/icn_"
	APPEND MENU ITEM:C411($vT_refMenu; $vT_header; $vT_refMenu_answer; *)
	RELEASE MENU:C978($vT_refMenu_answer)
	SET MENU ITEM ICON:C984($vT_refMenu; -1; $vT_path_menu+$vT_icon+k_png_ext)
End if 

