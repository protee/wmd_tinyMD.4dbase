//%attributes = {"invisible":true,"lang":"en"}
// Project Method: x_get_wh_lb_cell
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 25/01/2023   OG   Initial version.

#DECLARE($vP_LB : Pointer; $vP_LB_column : Pointer; $vP_width : Pointer; $vP_height : Pointer; $vL_scale : Integer)
If ($vL_scale=0)
	$vL_scale:=wmd__storage_prefs.l_svg_scale
End if 

var $vL_minWidth; $vL_maxWidth; $vL_width; $vL_height : Integer
$vL_width:=LISTBOX Get column width:C834($vP_LB_column->; $vL_minWidth; $vL_maxWidth)
$vL_height:=LISTBOX Get rows height:C836($vP_LB->; lk pixels:K53:22)-1
If ($vL_scale>1)
	$vL_width:=$vL_width*$vL_scale
	$vL_height:=$vL_height*$vL_scale
End if 
$vP_width->:=$vL_width
$vP_height->:=$vL_height



