//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_colors_to_svg
// Olivier Grimbert — Protée sarl — 22/08/2024 20:03:45
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****


#DECLARE($vL_colors : Integer; $vP_stroke : Pointer; $vP_fill : Pointer; $vL_kind : Integer)

var $vL_stroke; $vL_fill : Integer
wmd_md_colors_to_sf($vL_colors; ->$vL_stroke; ->$vL_fill)
$vP_stroke->:=wmd_md_color_to_svg($vL_stroke; $vL_kind)
$vP_fill->:=wmd_md_color_to_svg($vL_fill; $vL_kind)

