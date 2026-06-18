//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}


#DECLARE($vL_color : Integer; $is_prefix : Boolean; $is_transparent : Boolean)->$vT_color : Text  // {#2} optionals 
var $vL_rgb : Integer

$vL_rgb:=wmd_md_color_to_rgb($vL_color)
If ($vL_rgb=k_MDcolorTransparent) & $is_transparent
	$vT_color:="none"
Else 
	$vT_color:=wmd_rgb_to_html($vL_rgb; $is_prefix)
End if 

