//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_colors_to_rgb_tr
// Olivier Grimbert — Protée sarl — 22/08/2024 20:03:23
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_colors : Integer; $vP_vL_stroke_rgb : Pointer; $vP_vL_fill_rgb : Pointer; $is_invert : Boolean)  // {#4} optionals

var $vL_stroke; $vL_fill : Integer
wmd_md_colors_to_sf($vL_colors; ->$vL_stroke; ->$vL_fill)

If ($vL_stroke=0)
	$vL_stroke:=wmd_md_color_s_for_f($vL_fill)
	$is_invert:=False:C215
End if 

If ($is_invert)
	$vP_vL_stroke_rgb->:=wmd_md_color_to_rgb($vL_fill)
	$vP_vL_fill_rgb->:=wmd_md_color_to_rgb_tr($vL_stroke)
Else 
	$vP_vL_stroke_rgb->:=wmd_md_color_to_rgb($vL_stroke)
	$vP_vL_fill_rgb->:=wmd_md_color_to_rgb_tr($vL_fill)
End if 



