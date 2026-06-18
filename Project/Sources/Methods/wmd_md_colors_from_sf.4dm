//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_colors_from_sf
// Olivier Grimbert — Protée sarl — 22/08/2024 20:07:54
//
// Description: 
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_MDcolorStroke : Integer; $vL_MDcolorFill : Integer)->$vL_color : Integer

$vL_color:=($vL_MDcolorStroke << 8)+$vL_MDcolorFill


