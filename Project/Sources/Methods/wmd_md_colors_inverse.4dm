//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_colors_inverse
// Olivier Grimbert — Protée sarl — 22/08/2024 20:07:25
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_colors : Integer; $is_inverse : Boolean)->$vL_colors_out : Integer  // {#2} optionals
var $vL_colorStroke; $vL_colorFill : Integer
If (Count parameters:C259<2)
	$is_inverse:=True:C214
End if 

If ($is_inverse)  // For speed
	wmd_md_colors_to_sf($vL_colors; ->$vL_colorStroke; ->$vL_colorFill; $is_inverse)
	$vL_colors_out:=wmd_md_colors_from_sf($vL_colorStroke; $vL_colorFill)
Else 
	$vL_colors_out:=$vL_colors
End if 



