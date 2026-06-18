//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_colors_to_html
// Olivier Grimbert — Protée sarl — 22/08/2024 19:53:06
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_colors : Integer; $vP_MDcolorStroke : Pointer; $vP_MDcolorFill : Pointer; $is_prefix : Boolean; $is_transparent : Boolean)  // {#4} optionals

var $vL_stroke; $vL_fill : Integer
wmd_md_colors_to_sf($vL_colors; ->$vL_stroke; ->$vL_fill)
$vP_MDcolorStroke->:=wmd_md_color_to_html($vL_stroke; $is_prefix; $is_transparent)
$vP_MDcolorFill->:=wmd_md_color_to_html($vL_fill; $is_prefix; $is_transparent)


