//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// Project Method: wmd_md_color_to_infos
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 04/01/2023   OG   Initial version.

#DECLARE($vL_color : Integer; $is_rgb : Boolean)->$vT_color_infos : Text
var $vL_color_rgb : Integer
$vT_color_infos:=wmd_md_color_to_text($vL_color)
If ($is_rgb)
	$vL_color_rgb:=wmd_md_color_to_rgb($vL_color)
	$vT_color_infos:=$vT_color_infos+" • "+wmd_rgb_to_svg($vL_color_rgb)
End if 


