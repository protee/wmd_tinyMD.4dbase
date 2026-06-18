//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_colors_to_rgb_f_tr
// Olivier Grimbert — Protée sarl — 22/08/2024 19:59:00
//
// Description: 
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_colors : Integer)->$vL_color_rgb : Integer

var $vL_stroke; $vL_fill : Integer
wmd_md_colors_to_sf($vL_colors; ->$vL_stroke; ->$vL_fill)
$vL_color_rgb:=wmd_md_color_to_rgb_tr($vL_fill)




