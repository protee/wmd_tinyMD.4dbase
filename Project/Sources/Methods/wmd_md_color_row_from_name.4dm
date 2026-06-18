//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}


#DECLARE($vT_name : Text; $vL_inex_idx : Integer)->$vL_color_idx : Integer  // {#2} optionals  #GUESSED: $inex
var $vC_at_colorName : Collection
var $idx : Integer
var $vJ_space_md : Object

If (Count parameters:C259<2)
	$vL_inex_idx:=18
End if 

$vJ_space_md:=wmd__storage_space_md()
$vC_at_colorName:=$vJ_space_md.colorName
$idx:=$vC_at_colorName.indexOf($vT_name)
$vL_color_idx:=($idx>=0) ? $idx : $vL_inex_idx

