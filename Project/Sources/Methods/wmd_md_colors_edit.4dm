//%attributes = {"shared":true,"lang":"en","preemptive":"incapable"}
// *****
// *
// Method: wmd_md_colors_edit
// Olivier Grimbert — Protée sarl — 22/08/2024 20:17:27
//
// Description: 
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vP_vL_colors : Pointer; $is_sf : Boolean)->$isOk : Boolean  // {#2} optionals

var $vJ_form : Object
$vJ_form:=New object:C1471
$vJ_form.l_colors:=$vP_vL_colors->
$vJ_form.is_sf:=$is_sf
$vJ_form.is_editing:=True:C214
$vJ_form.is_stroke:=True:C214

$isOk:=wmd_md_colors_form($vJ_form)
If ($isOk)
	$vP_vL_colors->:=$vJ_form.l_colors
End if 

