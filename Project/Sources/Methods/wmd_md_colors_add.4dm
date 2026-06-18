//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_colors_add
// Olivier Grimbert — Protée sarl — 22/08/2024 20:13:59
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****


#DECLARE($vL_colors : Integer; $vL_offsetStroke : Integer; $vL_offsetFill : Integer)->$vL_colors_out : Integer  // {#2} optionals
var $vL_strokeOffset; $vL_stroke; $vL_fill : Integer
If (Count parameters:C259<2)
	$vL_strokeOffset:=9
End if 

wmd_md_colors_to_sf($vL_colors; ->$vL_stroke; ->$vL_fill)
$vL_stroke:=wmd_sp_color_add($vL_stroke; $vL_offsetStroke)
$vL_fill:=wmd_sp_color_add($vL_fill; $vL_offsetFill)
$vL_colors_out:=wmd_md_colors_from_sf($vL_stroke; $vL_fill)

