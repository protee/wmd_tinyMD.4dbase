//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_colors_random
// Olivier Grimbert — Protée sarl — 22/08/2024 19:54:55
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_offsetStroke : Integer; $vL_offsetFill : Integer)->$vL_colors : Integer  // {#1} optionals
var $vL_ColorRoot : Integer

If (Count parameters:C259<1)
	$vL_offsetStroke:=-1
End if 
If (Count parameters:C259<2)
	$vL_offsetFill:=-1
End if 
If ($vL_offsetStroke<0)
	$vL_offsetStroke:=9
End if 
If ($vL_offsetFill<0)
	$vL_offsetFill:=1
End if 

$vL_ColorRoot:=Random:C100%19*14
$vL_colors:=wmd_md_colors_from_sf(wmd_md_color_from_popup($vL_ColorRoot)+$vL_offsetStroke; wmd_md_color_from_popup($vL_ColorRoot)+$vL_offsetFill)


