//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_color_from_row
// Olivier Grimbert — Protée sarl — 22/08/2024 20:15:27
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****


#DECLARE($vL_row : Integer; $vL_offset : Integer; $vR_coef : Real)->$vL_color : Integer  // {#2} optionals  #GUESSED: $vL_offset
var $vL_popup : Integer
If (Count parameters:C259<2)
	$vL_offset:=5
End if 
If (Count parameters:C259<3)
	$vR_coef:=1
End if 

$vL_popup:=$vL_row*$vR_coef%19*14
$vL_color:=wmd_md_color_from_popup($vL_popup)+$vL_offset

