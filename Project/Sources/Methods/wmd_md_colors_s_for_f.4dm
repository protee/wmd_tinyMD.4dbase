//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_colors_s_for_f
// Olivier Grimbert — Protée sarl — 22/08/2024 19:53:22
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****


#DECLARE($vL_fill : Integer)->$vL_colors : Integer
var $isStrokeWhite : Boolean
var $vL_RGBfill; $vL_R; $vL_G; $vL_B; $vL_stroke : Integer
var $vR_luminance : Real

$vL_RGBfill:=wmd_md_color_to_rgb($vL_fill)

$vL_R:=$vL_RGBfill >> 16
$vL_G:=($vL_RGBfill >> 8) & 0x00FF
$vL_B:=$vL_RGBfill & 0x00FF
$vR_luminance:=((0.299*$vL_R)+(0.587*$vL_G)+(0.114*$vL_B))/255
$isStrokeWhite:=($vR_luminance<0.6)
If ($isStrokeWhite)
	$vL_stroke:=k_MDcolorWhite
Else 
	$vL_stroke:=k_MDcolorBlack
End if 
$vL_colors:=wmd_md_colors_from_sf($vL_stroke; $vL_fill)

