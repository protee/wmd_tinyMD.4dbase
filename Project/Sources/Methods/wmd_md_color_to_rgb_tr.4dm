//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}

#DECLARE($vL_color : Integer)->$vL_color_rgb : Integer

$vL_color:=$vL_color & 0x00FF  // MD int
If ($vL_color=k_MDcolorTransparent)
	$vL_color_rgb:=Background color none:K23:10
	
Else 
	var $vJ_space_md : Object
	var $vC_al_colorRGB : Collection
	$vJ_space_md:=wmd__storage_space_md
	$vC_al_colorRGB:=$vJ_space_md.colorRGB
	$vL_color_rgb:=$vC_al_colorRGB[$vL_color]
End if 


