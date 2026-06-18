//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}


#DECLARE($vL_offsetStroke : Integer)->$vL_color : Integer  // {#1} optionals 
var $vL_ColorRoot : Integer

If (Count parameters:C259<1)
	$vL_offsetStroke:=9
End if 

$vL_ColorRoot:=Random:C100%19*14
$vL_color:=wmd_md_color_from_popup($vL_ColorRoot)+$vL_offsetStroke

