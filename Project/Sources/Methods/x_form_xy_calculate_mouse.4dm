//%attributes = {"lang":"en","invisible":true}
// Project Method: x_form_xy_calculate_mouse
//
// Parameter Type Description
//
//
// Description:
// 
//
// Date        Init  Description
// ===================================================================
// 02/04/2022   OG   Initial version.

#DECLARE($vP_table : Pointer; $vT_form : Text; $vP_left : Pointer; $vP_top : Pointer; $vL_framed : Integer)  // {#5} optionals 

var $x; $y; $vL_buttons : Integer
MOUSE POSITION:C468($x; $y; $vL_buttons; *)
$vP_left->:=$x
$vP_top->:=$y  //-($height/2)
var $vP_null : Pointer
x_form_xy_calculate($vP_null; $vT_form; $vP_left; $vP_top; $vL_framed)



