//%attributes = {"shared":true,"lang":"en"}
// Project Method: wmd_svg_pattern_picture
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 18/02/2023   OG   Initial version.

#DECLARE($vP_canvas : Pointer; $vL_pattern : Integer; $vT_stroke_svg : Text; $vT_fill_svg : Text; $vL_rxy : Integer; $vL_stroke : Integer; $vL_opacity : Integer)->$vO_picture : Picture  // {#2}
var $is_prefs : Boolean
var $vL_left; $vL_top; $vL_right; $vL_bottom; $vL_svg_height; $vL_svg_width; $vL_svg_scale; $vL_colors; $vL_strokeD2 : Integer
var $vJ_prefs : Object
var $vT_svg_root; $vT_shape_rendering; $vT_patt_name; $vT_svg_pattern; $vT_object : Text
If (Count parameters:C259<7)
	$vL_opacity:=100
End if 
$is_prefs:=(Count parameters:C259<4)

OBJECT GET COORDINATES:C663($vP_canvas->; $vL_left; $vL_top; $vL_right; $vL_bottom)
$vL_svg_height:=$vL_bottom-$vL_top
$vL_svg_width:=$vL_right-$vL_left
$vJ_prefs:=wmd__storage_prefs
$vL_svg_scale:=$vJ_prefs.l_svg_scale
$vL_svg_width:=$vL_svg_width*$vL_svg_scale
$vL_svg_height:=$vL_svg_height*$vL_svg_scale

If ($vL_rxy=-1)
	$vL_rxy:=wox_min($vL_svg_width/10; $vL_svg_height/10)
End if 

If ($is_prefs)
	$vL_pattern:=$vJ_prefs.empty_pattern
	$vL_colors:=$vJ_prefs.empty_colors
	wmd_md_colors_to_svg($vL_colors; ->$vT_stroke_svg; ->$vT_fill_svg)
	$vL_opacity:=100
End if 

$vL_stroke:=$vL_stroke*$vL_svg_scale
$vL_strokeD2:=$vL_stroke/2

$vT_svg_root:=SVG_New($vL_svg_width; $vL_svg_height)
$vT_shape_rendering:=wmd__storage_prefs().t_svg_rendering  // "auto", "optimizeSpeed", "crispEdges", "geometricPrecision" or "inherit"
SVG_SET_SHAPE_RENDERING($vT_svg_root; $vT_shape_rendering)
$vT_patt_name:="patt"
$vT_svg_pattern:=wmd_svg_patterns($vT_svg_root; $vT_patt_name; $vL_pattern; $vT_stroke_svg; $vT_fill_svg)
$vT_object:=SVG_New_rect($vT_svg_root; $vL_strokeD2; $vL_strokeD2; $vL_svg_width-$vL_stroke; $vL_svg_height-$vL_stroke; $vL_rxy; $vL_rxy; $vT_stroke_svg; "url(#"+$vT_patt_name+")"; $vL_stroke)  // 2*$vL_svg_scale)
SVG_SET_OPACITY($vT_object; $vL_opacity; $vL_opacity)
SVG EXPORT TO PICTURE:C1017($vT_svg_root; $vO_picture; Get XML data source:K45:16)
SVG_CLEAR($vT_svg_root)

