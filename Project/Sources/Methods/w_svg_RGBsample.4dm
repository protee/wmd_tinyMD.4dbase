//%attributes = {"lang":"en","invisible":true}
// Project Method: w_svg_RGBsample
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 05/07/2022   OG   Initial version.

#DECLARE($vP_canvas : Pointer; $vL_colors : Integer; $is_sf : Boolean; $is_stroke : Boolean)
var $c4Fo_sf : 4D:C1709.Folder
var $is_white_color; $is_white : Boolean
var $vL_svg_scale; $vL_width; $vL_height; $vL_size; $vL_cx; $vL_stroke_color; $vL_fill_color; $vL_index_stroke; $vL_index_fill; $vL_stroke_rgb; $vL_fill_rgb; $vL_stroke_width; $vL_offset; $x9; $vL_cy; $vL_icon_width; $vL_color_rgb; $x; $vL_sf_width; $y; $vL_r; $vL_stroke; $vL_strokeD2 : Integer
var $vO_thumbnail : Picture
var $vT_svg_title; $vT_svg_root; $vT_shape_rendering; $vT_patt_none_name; $vT_colour_stroke; $vT_colour_txt; $vT_colour_fill; $vT_text; $vT_svg_stroke; $vT_RectRef; $vT_svg_fill; $vT_font_name; $vT_svg_txt; $vT_svg_sf; $vT_svg_b; $vT_tileRef : Text

$vL_svg_scale:=wmd__storage_prefs.l_svg_scale
x_widthHeight_Object($vP_canvas; ->$vL_width; ->$vL_height; $vL_svg_scale)


$vT_svg_title:="rgb_sample"
$vT_svg_root:=SVG_New($vL_width; $vL_height; $vT_svg_title; $vT_svg_title; True:C214; Truncated centered:K6:1)
$vT_shape_rendering:=wmd__storage_prefs().t_svg_rendering  // "auto", "optimizeSpeed", "crispEdges", "geometricPrecision" or "inherit"
SVG_SET_SHAPE_RENDERING($vT_svg_root; $vT_shape_rendering)
$vT_patt_none_name:="nonePattern"
wmd_svg_pattern_empty($vT_svg_root; $vT_patt_none_name)

// Check is_sf
$vL_size:=10*$vL_svg_scale
$vL_cx:=$vL_width/2


If ($is_sf)
	wmd_md_colors_to_sf($vL_colors; ->$vL_stroke_color; ->$vL_fill_color)
	$vL_index_stroke:=$vL_stroke_color
	$vL_index_fill:=$vL_fill_color
	
	$vL_stroke_rgb:=wmd_md_color_to_rgb($vL_index_stroke)
	$vT_colour_stroke:=wmd_rgb_to_svg($vL_stroke_rgb)
	$vT_colour_txt:=($vT_colour_stroke=k_none) ? "white" : $vT_colour_stroke
	$vT_colour_stroke:=($vT_colour_stroke=k_none) ? "url(#"+$vT_patt_none_name+")" : $vT_colour_stroke
	
	$vL_fill_rgb:=wmd_md_color_to_rgb($vL_index_fill)
	$vT_colour_fill:=wmd_rgb_to_svg($vL_fill_rgb)
	$vT_colour_fill:=($vT_colour_fill=k_none) ? "url(#"+$vT_patt_none_name+")" : $vT_colour_fill
	$vT_text:=x_get_color_infos($vL_stroke_color)+Char:C90(Carriage return:K15:38)+x_get_color_infos($vL_fill_color)
	
	
	// Stroke part
	$vL_stroke_width:=$vL_height/2  // or golden 1.61
	$vL_offset:=$vL_size/2*k_fontOffset_coef
	$x9:=$vL_width-$vL_stroke_width
	$vT_svg_stroke:=SVG_New_group($vT_svg_root; "stroke")
	$vT_RectRef:=SVG_New_rect($vT_svg_stroke; $x9; 0; $vL_width; $vL_height; 0; 0; k_none; $vT_colour_stroke)
	//$vL_width1:=$vL_width-$vL_height
	$vL_cy:=$vL_size
	$vL_cx:=$vL_cx-$vL_stroke_width
	
Else 
	$vL_index_fill:=$vL_colors
	$vL_fill_rgb:=wmd_md_color_to_rgb($vL_index_fill)
	$vT_colour_fill:=wmd_rgb_to_svg($vL_fill_rgb)
	$vT_colour_fill:=($vT_colour_fill=k_none) ? "url(#"+$vT_patt_none_name+")" : $vT_colour_fill
	$is_white_color:=wmd_rgb_isWhiteFor($vL_fill_rgb)
	$vT_colour_stroke:=$is_white_color ? "white" : "black"
	$vT_colour_txt:=$vT_colour_stroke
	$vT_text:=x_get_color_infos($vL_colors)
	$vL_offset:=$vL_size*k_fontOffset_coef
	//$x9:=$vL_width
	$x9:=$vL_width
	$vL_cy:=$vL_height/2
End if 

// Fill part
$vT_svg_fill:=SVG_New_group($vT_svg_root; "fill")
$vT_RectRef:=SVG_New_rect($vT_svg_fill; 0; 0; $x9; $vL_height; 0; 0; k_none; $vT_colour_fill)
$vT_font_name:="Lucida Grande"
$vT_svg_txt:=SVG_New_text($vT_svg_fill; $vT_text; $vL_cx; $vL_cy-$vL_offset; $vT_font_name; $vL_size; Bold:K14:2; 3; $vT_colour_txt)
SVG_SET_TEXT_RENDERING($vT_svg_txt; "geometricPrecision")

// SF icons
If ($is_sf)
	$c4Fo_sf:=Folder:C1567(fk resources folder:K87:11).folder("icons")
	$vL_icon_width:=$vL_stroke_width
	$vL_color_rgb:=$is_stroke ? $vL_stroke_rgb : $vL_fill_rgb
	$x:=$is_stroke ? $x9 : 0
	$vL_sf_width:=$is_stroke ? $vL_stroke_width : $x9
	$vT_svg_sf:=$is_stroke ? $vT_svg_stroke : $vT_svg_fill
	$y:=$vL_height-$vL_stroke_width/2
	$is_white:=wmd_rgb_isWhiteFor($vL_color_rgb)
	$vO_thumbnail:=_colourWidget_sf_icon($is_stroke; Not:C34($is_stroke); $is_white; $vL_icon_width; $vL_icon_width; $c4Fo_sf)
	$vT_svg_b:=SVG_New_embedded_image($vT_svg_sf; $vO_thumbnail; $x; $y)
	//If ($is_stroke)
	$vL_r:=0
	$vL_stroke:=2
	$vT_colour_stroke:=$is_white ? "white" : "black"
	//$vT_colour_stroke:="black"
	$vL_strokeD2:=$vL_stroke/2
	$vT_tileRef:=SVG_New_rect($vT_svg_sf; $x+$vL_strokeD2; $vL_strokeD2; $vL_sf_width-$vL_stroke; $vL_height-$vL_stroke; $vL_r; $vL_r; $vT_colour_stroke; k_none; $vL_stroke)
	//End if
End if 
//$vT_RectRef:=SVG_New_rect($vT_svg_ref; 1; 1; $vL_width-2; $vL_height-2; 0; 0; "black"; k_none; 1)

$vP_canvas->:=SVG_Export_to_picture($vT_svg_root; 0)
SVG_CLEAR($vT_svg_root)


