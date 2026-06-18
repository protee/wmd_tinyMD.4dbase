//%attributes = {"shared":true,"lang":"en","preemptive":"incapable"}

#DECLARE($vP_LB : Pointer; $vP_LB_column : Pointer; $vL_colors : Integer; $vL_shape : Integer; $vL_stroke : Integer)->$vO_picture : Picture
var $vL_height; $vL_width : Integer
If (Count parameters:C259<5)
	$vL_stroke:=0x0003  // 0x0sf or stroke
End if 

x_get_wh_lb_cell($vP_LB; $vP_LB_column; ->$vL_width; ->$vL_height)
$vO_picture:=wmd_md_shape_get($vL_width; $vL_height; $vL_colors; $vL_shape; $vL_stroke)



