//%attributes = {"shared":true,"lang":"en","preemptive":"incapable"}
// Project Method: wmd_md_color_menu_create
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

#DECLARE($vL_color : Integer; $vT_prefix : Text; $vT_subMenu_name : Text; $vT_refMenu : Text)->$vT_refMenu_colour : Text  //  #GUESSED: $vT_refMenu_colour, $vL_color, $vT_prefix, $vT_subMenu_name
var $is_toAttach : Boolean
var $vC_al_colorRGB : Collection
var $vL_count_parameters; $idx; $vL_color_rgb : Integer
var $vJ_space_md : Object
var $vT_path_colors; $vT_path_colors_icns; $vT_colour_name; $vT_menu_param : Text
$vL_count_parameters:=Count parameters:C259

If ($vT_prefix#"")
	$vT_prefix+="-"
End if 

$is_toAttach:=($vT_refMenu#"")

$vJ_space_md:=wmd__storage_space_md
$vC_al_colorRGB:=$vJ_space_md.colorRGB

$vT_path_colors:="path:/RESOURCES/colors/"
$vT_path_colors_icns:=$vT_path_colors+"md/icnm_"

$vT_refMenu_colour:=Create menu:C408
$idx:=0
For each ($vL_color_rgb; $vC_al_colorRGB)
	$vT_colour_name:=wmd_md_color_to_name($idx; $vJ_space_md)
	$vT_menu_param:=String:C10($idx)
	APPEND MENU ITEM:C411($vT_refMenu_colour; $vT_colour_name)
	SET MENU ITEM PARAMETER:C1004($vT_refMenu_colour; -1; $vT_prefix+"color-"+$vT_menu_param)
	SET MENU ITEM ICON:C984($vT_refMenu_colour; -1; $vT_path_colors_icns+$vT_menu_param+k_png_ext)
	$idx+=1
End for each 
SET MENU ITEM MARK:C208($vT_refMenu_colour; $vL_color+1; Char:C90(18))

$vT_colour_name:=Localized string:C991("menu_personalized")
$vT_menu_param:="picker"
APPEND MENU ITEM:C411($vT_refMenu_colour; $vT_colour_name)
SET MENU ITEM PARAMETER:C1004($vT_refMenu_colour; -1; $vT_prefix+"color-"+$vT_menu_param)
SET MENU ITEM ICON:C984($vT_refMenu_colour; -1; $vT_path_colors+$vT_menu_param+k_png_ext)

If ($is_toAttach)
	$vT_menu_param:=String:C10($vL_color)
	$vT_colour_name:=wmd_md_color_to_name($vL_color; $vJ_space_md)
	If ($vT_subMenu_name#"")
		$vT_subMenu_name+=": "
	End if 
	APPEND MENU ITEM:C411($vT_refMenu; $vT_subMenu_name+$vT_colour_name; $vT_refMenu_colour)
	SET MENU ITEM ICON:C984($vT_refMenu; -1; $vT_path_colors_icns+$vT_menu_param+k_png_ext)
	RELEASE MENU:C978($vT_refMenu_colour)
End if 

