//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_color_from_rgb
// Olivier Grimbert — Protée sarl — 22/08/2024 20:15:39
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_color_rgb : Integer)->$vL_color : Integer
var $vL_r; $vL_g; $vL_b : Integer

If ($vL_color_rgb<0)
	$vL_color:=k_MDcolorTransparent
Else 
	wmd_rgb_to_r_g_b($vL_color_rgb; ->$vL_r; ->$vL_g; ->$vL_b)
	$vL_color:=wmd_md_color_from_r_g_b($vL_r; $vL_g; $vL_b)
End if 

