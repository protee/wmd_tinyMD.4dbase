//%attributes = {"preemptive":"capable","lang":"en"}
// *****
// *
// Method: wmd_md_shape_icn
// Olivier Grimbert — Protée sarl — 24/08/2024 17:20:33
//
// Description:
//
// Date       | Who | Comment
// 24/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_width : Integer; $vL_height : Integer; $vL_rxy : Integer; $vT_color_stroke : Text; $vT_color_fill : Text; $vL_stroke : Integer; $vL_shape : Integer)->$vO_picture : Picture
var $vR_cx; $vR_cy; $vR_radius_w; $vR_radius_h : Real
var $vT_svg_title; $vT_svg_root; $vT_shape_rendering; $vT_RectRef : Text

$vT_svg_title:="shape_icn"
$vT_svg_root:=SVG_New($vL_width; $vL_height; $vT_svg_title; $vT_svg_title; True:C214; Truncated non centered:K6:4)
$vT_shape_rendering:=wmd__storage_prefs().t_svg_rendering  // "auto", "optimizeSpeed", "crispEdges", "geometricPrecision" or "inherit"
SVG_SET_SHAPE_RENDERING($vT_svg_root; $vT_shape_rendering)
If ($vL_shape=0)
	$vT_RectRef:=SVG_New_rect($vT_svg_root; 0; 0; $vL_width; $vL_height; $vL_rxy; $vL_rxy; $vT_color_stroke; $vT_color_fill; $vL_stroke)
	
Else 
	$vR_cx:=$vL_width/2
	$vR_cy:=$vL_height/2
	$vR_radius_w:=$vR_cx-$vL_stroke
	$vR_radius_h:=$vR_cy-$vL_stroke
	$vT_RectRef:=wmd_svg_object($vT_svg_root; $vL_shape; $vR_cx; $vR_cy; $vR_radius_w; $vR_radius_h; $vT_color_stroke; $vT_color_fill; $vL_stroke; 100; $vL_rxy; $vL_rxy; $vL_rxy; $vL_rxy)
End if 
$vO_picture:=SVG_Export_to_picture($vT_svg_root; 0)
SVG_CLEAR($vT_svg_root)

