//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_colors_to_f
// Olivier Grimbert — Protée sarl — 22/08/2024 19:53:15
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_colors_in : Integer)->$vL_colors : Integer

var $vJ_prefs : Object
$vJ_prefs:=wmd__storage_prefs
If ($vL_colors_in=0) && $vJ_prefs.is_md_null
	$vL_colors_in:=$vJ_prefs.l_md_null
End if 
$vL_colors:=$vL_colors_in & 0x00FF


