
var $vL_event_code; $vL_colors; $vL_shape; $vL_stroke : Integer
var $vJ_widget : Object
var $vP_object : Pointer

$vL_event_code:=Form event code:C388
Case of 
	: ($vL_event_code=On Load:K2:1)
		$vJ_widget:=Self:C308->
		$vL_colors:=32122
		$vJ_widget.l_colors:=$vL_colors
		$vJ_widget.resize()
		$vJ_widget.redraw()
		
		
	: ($vL_event_code=k_OnDataChange)
		$vJ_widget:=Self:C308->
		$vL_colors:=$vJ_widget.l_colors
		
End case 

$vL_shape:=1  // circle
$vL_stroke:=3
OBJECT SET VALUE:C1742("oO_shape"; wmd_md_shape_get(16; 16; $vL_colors; $vL_shape))
OBJECT SET VALUE:C1742("oO_shape1"; wmd_md_shape_get(25; 18; $vL_colors; $vL_shape; $vL_stroke))

$vP_object:=OBJECT Get pointer:C1124(Object named:K67:5; "oO_shape2")
$vP_object->:=wmd_md_shape_get_object($vP_object; $vL_colors; $vL_shape; $vL_stroke)
$vP_object:=OBJECT Get pointer:C1124(Object named:K67:5; "oO_shape3")
$vP_object->:=wmd_md_shape_get_object($vP_object; $vL_colors; -5; $vL_stroke)

