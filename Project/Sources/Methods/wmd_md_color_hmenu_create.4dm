//%attributes = {"shared":true,"lang":"en","preemptive":"incapable"}
// Project Method: wmd_md_color_hmenu_create
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

#DECLARE($vL_color : Integer; $vT_prefix : Text; $vT_subMenu_name : Text; $vT_refMenu : Text)->$vT_refMenu_colour : Text
var $is_toAttach; $is_mark : Boolean
var $vC_al_break; $vC_at_name; $vC_at_density : Collection
var $vL_density_idx; $vL_count_breaks; $idx; $vL_y_start; $vL_row; $vL_break; $idx2; $vL_density : Integer
var $vJ_space_md : Object
var $vT_path_colors; $vT_path_colors_icns; $vT_refSubMenu_colour; $vT_colour_name; $vT_menu_param; $vT_color_file : Text

If ($vT_prefix#"")
	$vT_prefix+="-"
End if 

$is_toAttach:=($vT_refMenu#"")

$vT_path_colors:="path:/RESOURCES/colors/"
$vT_path_colors_icns:=$vT_path_colors+"md/"
$vL_density_idx:=5

$vJ_space_md:=wmd__storage_space_md

$vC_al_break:=$vJ_space_md.al_break
$vL_count_breaks:=$vC_al_break.length

$vC_at_name:=$vJ_space_md.colorName
$vC_at_density:=$vJ_space_md.at_density

$vT_refMenu_colour:=Create menu:C408

$idx:=0
$vL_y_start:=0
$vL_row:=0
For each ($vL_break; $vC_al_break)  // Transparent separately => NO MORE
	// Sub menu
	$vT_refSubMenu_colour:=Create menu:C408
	$idx2:=$idx
	$is_mark:=False:C215
	For ($vL_density; $idx; $vL_break-1)
		$vT_colour_name:=$vC_at_density[$vL_density-$idx2]
		$vT_menu_param:=String:C10($idx)
		$vT_color_file:="icnm_"+$vT_menu_param+k_png_ext
		APPEND MENU ITEM:C411($vT_refSubMenu_colour; $vT_colour_name)
		SET MENU ITEM PARAMETER:C1004($vT_refSubMenu_colour; -1; $vT_prefix+"color-"+$vT_menu_param)
		SET MENU ITEM ICON:C984($vT_refSubMenu_colour; -1; $vT_path_colors_icns+$vT_color_file)
		If ($idx=$vL_color)
			$is_mark:=True:C214
			SET MENU ITEM MARK:C208($vT_refSubMenu_colour; -1; Char:C90(18))
		End if 
		$idx+=1
	End for 
	$vT_colour_name:=$vC_at_name[$vL_row]
	$vT_menu_param:=String:C10($idx2+$vL_density_idx)
	$vT_color_file:="icnm_"+$vT_menu_param+k_png_ext
	APPEND MENU ITEM:C411($vT_refMenu_colour; $vT_colour_name; $vT_refSubMenu_colour)
	SET MENU ITEM ICON:C984($vT_refMenu_colour; -1; $vT_path_colors_icns+$vT_color_file)
	If ($is_mark)
		SET MENU ITEM MARK:C208($vT_refMenu_colour; -1; Char:C90(18))
	End if 
	$vL_row+=1
	$idx:=$vL_break  // Next bloc
End for each 

// transparent
$idx:=k_MDcolorTransparent
$vT_colour_name:=wmd_md_color_to_name($idx)
$vT_menu_param:=String:C10($idx)
$vT_color_file:="icnm_"+$vT_menu_param+k_png_ext
APPEND MENU ITEM:C411($vT_refMenu_colour; $vT_colour_name)
SET MENU ITEM PARAMETER:C1004($vT_refMenu_colour; -1; $vT_prefix+"color-"+$vT_menu_param)
SET MENU ITEM ICON:C984($vT_refMenu_colour; -1; $vT_path_colors_icns+$vT_color_file)
$is_mark:=($idx=$vL_color)
If ($is_mark)
	SET MENU ITEM MARK:C208($vT_refMenu_colour; -1; Char:C90(18))
End if 

$vT_colour_name:=Localized string:C991("menu_personalized")
$vT_menu_param:="picker"
$vT_color_file:="icnm_"+$vT_menu_param+k_png_ext
APPEND MENU ITEM:C411($vT_refMenu_colour; $vT_colour_name)
SET MENU ITEM PARAMETER:C1004($vT_refMenu_colour; -1; $vT_prefix+"color-"+$vT_menu_param)
SET MENU ITEM ICON:C984($vT_refMenu_colour; -1; $vT_path_colors+$vT_color_file)

//SET MENU ITEM MARK($vT_refMenu_colour;$vL_color+1;Char(18))


If ($is_toAttach)
	$vT_menu_param:=String:C10($vL_color)
	$vT_color_file:="icnm_"+$vT_menu_param+k_png_ext
	$vT_colour_name:=wmd_md_color_to_name($vL_color; $vJ_space_md)
	If ($vT_subMenu_name#"")
		$vT_subMenu_name+=": "
	End if 
	APPEND MENU ITEM:C411($vT_refMenu; $vT_subMenu_name+$vT_colour_name; $vT_refMenu_colour)
	SET MENU ITEM ICON:C984($vT_refMenu; -1; $vT_path_colors_icns+$vT_color_file)
	RELEASE MENU:C978($vT_refMenu_colour)
End if 

