//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_color_from_html
// Olivier Grimbert — Protée sarl — 22/08/2024 20:16:06
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vT_web : Text)->$vL_color : Integer  //  #GUESSED: $TO_CHECK, $vT_web

var $vL_rgb : Integer
$vL_rgb:=wmd_rgb_from_html($vT_web)
$vL_color:=wmd_md_color_from_rgb($vL_rgb)


