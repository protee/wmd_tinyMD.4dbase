//%attributes = {"shared":true,"preemptive":"capable","lang":"en"}
// Project Method: wmd_rgb_from_r_g_b_to_text
//
// Parameter Type    Description
// $1        Longint Red value
// $2        Longint Green value
// $3        Longint Blue value
// {$4}      Text    Colour name, check if "none" for same answer.
//
// $0        Text    Form "rgb(r,g,b)" or "none".
//
// Description:
// Convert Red green blue to an rgb(r,g,b) string
//
// Date        Init  Description
// ===================================================================
// 22/02/2021   OG   Initial version.
// 27/02/2021   OG   Add the "none" option

#DECLARE($vL_red : Integer; $vL_green : Integer; $vL_blue : Integer; $vT_none : Text)->$vT_ColourRGB : Text

var $is_none : Boolean
$is_none:=(k_none=$vT_none)
If ($is_none)
	$vT_ColourRGB:=k_none
Else 
	$vT_ColourRGB:="rgb("+String:C10($vL_red)+","+String:C10($vL_green)+","+String:C10($vL_blue)+")"
End if 


