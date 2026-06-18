//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// Project Method: wmd_md_color_to_name
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 16/04/2021   OG   Initial version.

#DECLARE($vL_color : Integer; $vJ_space_md : Object)->$vT_color_name : Text

var $vL_row; $vL_column : Integer
$vJ_space_md:=$vJ_space_md#Null:C1517 ? $vJ_space_md : wmd__storage_space_md

If ($vL_color=k_MDcolorTransparent)
	$vT_color_name:="None"
Else 
	wmd_md_color_to_rowCol($vL_color; ->$vL_row; ->$vL_column)
	$vT_color_name:=$vJ_space_md.colorName[$vL_row]+" "+$vJ_space_md.at_density[$vL_column]
End if 


