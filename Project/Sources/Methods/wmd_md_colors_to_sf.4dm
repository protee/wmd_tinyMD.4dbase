//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_colors_to_sf
// Olivier Grimbert — Protée sarl — 22/08/2024 20:03:36
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_colors_in : Integer; $vP_stroke_color : Pointer; $vP_fill_color : Pointer; $is_invert : Boolean)

//$is_null:=True

var $vJ_prefs : Object
$vJ_prefs:=wmd__storage_prefs
If ($vL_colors_in=0) && $vJ_prefs.is_md_null  //&& $is_null
	$vL_colors_in:=$vJ_prefs.l_md_null
End if 

var $vL_fill_color; $vL_stroke_color : Integer
$vL_stroke_color:=($vL_colors_in >> 8) & 0x00FF
$vL_fill_color:=$vL_colors_in & 0x00FF

If ($is_invert)
	$vP_stroke_color->:=$vL_fill_color
	$vP_fill_color->:=$vL_stroke_color
Else 
	$vP_stroke_color->:=$vL_stroke_color
	$vP_fill_color->:=$vL_fill_color
End if 


