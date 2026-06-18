//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_color_isWhite_for
// Olivier Grimbert — Protée sarl — 22/08/2024 20:14:43
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_fill : Integer)->$isStrokeWhite : Boolean
var $vL_RGBfill; $vL_R; $vL_G; $vL_B : Integer
var $vR_luminance : Real

$vL_RGBfill:=wmd_md_color_to_rgb($vL_fill)

$vL_R:=$vL_RGBfill >> 16
$vL_G:=($vL_RGBfill >> 8) & 0x00FF
$vL_B:=$vL_RGBfill & 0x00FF
$vR_luminance:=((0.299*$vL_R)+(0.587*$vL_G)+(0.114*$vL_B))/255
$isStrokeWhite:=($vR_luminance<0.6)

