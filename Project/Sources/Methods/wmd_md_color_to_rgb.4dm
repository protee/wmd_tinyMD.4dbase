//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_color_to_rgb
// Olivier Grimbert — Protée sarl — 21/08/2024 18:19:02
//
// Description:
//
// Date       | Who | Comment
// 21/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_color : Integer)->$vL_color_rgb : Integer

var $vJ_space_md : Object
var $vC_al_colorRGB : Collection
$vJ_space_md:=wmd__storage_space_md
$vC_al_colorRGB:=$vJ_space_md.colorRGB

$vL_color:=$vL_color & 0x00FF  // MD int
$vL_color_rgb:=$vC_al_colorRGB[$vL_color]


