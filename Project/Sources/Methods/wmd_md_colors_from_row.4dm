//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_colors_from_row
// Olivier Grimbert — Protée sarl — 22/08/2024 20:08:12
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****


#DECLARE($idx : Integer; $vL_strokeOffset : Integer; $vL_fillOffset : Integer; $vR_coef : Real)->$vL_colors : Integer  // {#2} optionals
var $vL_color : Integer
If (Count parameters:C259<2)
	$vL_strokeOffset:=9
End if 
If (Count parameters:C259<4)
	$vR_coef:=1
End if 

$vL_color:=$idx*$vR_coef%19*14
$vL_color:=wmd_md_color_from_popup($vL_color)
$vL_colors:=wmd_md_colors_from_sf($vL_color+$vL_strokeOffset; $vL_color+$vL_fillOffset)


