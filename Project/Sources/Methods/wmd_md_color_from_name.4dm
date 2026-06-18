//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_color_from_name
// Olivier Grimbert — Protée sarl — 22/08/2024 20:15:59
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vT_name : Text; $vL_offset : Integer)->$vL_color : Integer  // {#2} optionals  #GUESSED: $vL_offset
var $idx : Integer

If (Count parameters:C259<2)
	$vL_offset:=9
End if 

$idx:=wmd_md_color_row_from_name($vT_name)
If ($idx>=0)
	$vL_color:=$idx*14
	$vL_color:=wmd_md_color_from_popup($vL_color)+$vL_offset
Else 
	$vL_color:=k_MDcolorBlack
End if 

