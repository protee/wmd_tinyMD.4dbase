//%attributes = {"preemptive":"capable","shared":true,"lang":"en"}
// *****
// *
// Method: wmd_svg_object
// Olivier Grimbert — Protée sarl — 19/08/2024 13:28:00
//
// Description: 
//
// Date       | Who | Comment
// 12/12/2022 | OG  | Initial version.
// 19/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vT_svg_root : Text; $vL_shape : Integer; $vR_cx : Real; $vR_cy : Real; $vR_radius_w : Real; $vR_radius_h : Real; $vT_color_stroke : Text; $vT_color_fill : Text; $vL_stroke : Integer; $vL_opacity : Integer; $vL_rx : Integer; $vL_ry : Integer)->$vT_svg_object : Text  // {#2}
var $isOk : Boolean
var $vR_strokeD2 : Real
If (Count parameters:C259<10)
	$vL_opacity:=100
End if 

$vR_strokeD2:=$vL_stroke/2

$isOk:=True:C214
Case of 
		//: ($vL_shape=0)  // None
		
	: ($vL_shape=1)  // Rectangle
		$vT_svg_object:=SVG_New_rect($vT_svg_root; $vR_cx-($vR_radius_w-$vR_strokeD2); $vR_cy-($vR_radius_h-$vR_strokeD2); ($vR_radius_w-$vR_strokeD2)*2; ($vR_radius_h-$vR_strokeD2)*2; $vL_rx; $vL_ry; $vT_color_stroke; $vT_color_fill; $vL_stroke)
		
	: ($vL_shape=2)  // ellipse
		$vT_svg_object:=SVG_New_ellipse($vT_svg_root; $vR_cx; $vR_cy; $vR_radius_w-$vR_strokeD2; $vR_radius_h-$vR_strokeD2; $vT_color_stroke; $vT_color_fill; $vL_stroke)
		
	Else 
		$isOk:=False:C215
		
End case 

If ($isOk)
	SVG_SET_OPACITY($vT_svg_object; $vL_opacity; $vL_opacity)  // entre 0 et 50 pour la commande
End if 

