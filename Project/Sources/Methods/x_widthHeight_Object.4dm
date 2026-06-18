//%attributes = {"invisible":true,"lang":"en"}

#DECLARE($vP_object : Pointer; $vP_width : Pointer; $vP_height : Pointer; $vL_scale : Integer)

var $vL_left; $vL_top; $vL_right; $vL_bottom; $vL_width; $vL_height : Integer
OBJECT GET COORDINATES:C663($vP_object->; $vL_left; $vL_top; $vL_right; $vL_bottom)
$vL_width:=$vL_right-$vL_left
$vL_height:=$vL_bottom-$vL_top
If ($vL_scale>1)
	$vL_width:=$vL_width*$vL_scale
	$vL_height:=$vL_height*$vL_scale
End if 
$vP_width->:=$vL_width
$vP_height->:=$vL_height


