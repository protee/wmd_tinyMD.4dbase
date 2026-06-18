//%attributes = {"invisible":true,"lang":"en"}
// *****
// *
// Method: x_get_wh_object
// Olivier Grimbert — Protée sarl — 24/08/2024 17:38:10
//
// Description:
//
// Date       | Who | Comment
// 24/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vP_object : Pointer; $vP_width : Pointer; $vP_height : Pointer; $vL_scale : Integer)
If ($vL_scale=0)
	$vL_scale:=wmd__storage_prefs.l_svg_scale
End if 

var $vL_left; $vL_top; $vL_right; $vL_bottom : Integer
OBJECT GET COORDINATES:C663($vP_object->; $vL_left; $vL_top; $vL_right; $vL_bottom)
var $vL_height; $vL_width : Integer
$vL_width:=$vL_right-$vL_left
$vL_height:=$vL_bottom-$vL_top
If ($vL_scale>1)
	$vL_width:=$vL_width*$vL_scale
	$vL_height:=$vL_height*$vL_scale
End if 
$vP_width->:=$vL_width
$vP_height->:=$vL_height


