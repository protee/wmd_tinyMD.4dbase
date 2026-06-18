//%attributes = {"invisible":true,"lang":"en"}
// Project Method: w_svg_colorsGrig
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 25/02/2021   OG   Initial version.

#DECLARE($vP_canvas : Pointer; $vL_colors : Integer; $is_sf : Boolean; $is_stroke : Boolean; $vL_shape : Integer)
var $c4Fo_sf : 4D:C1709.Folder
var $is_aL_break; $is_transparent; $is_white_color; $is_fill; $is_img; $is_white : Boolean
var $vC_al_break; $vC_al_colorRGB : Collection
var $vL_svg_scale; $vL_width; $vL_height; $vL_count_colors; $vL_count_w; $vL_count_h; $vL_break_last; $vL_break; $vL_break_idx; $vL_surface; $vL_surface_square; $vL_stroke_color; $vL_fill_color; $vL_stroke_index; $vL_fill_index; $vL_index; $vL_r; $vL_idx; $vL_color_rgb : Integer
var $vJ_space_md : Object
var $vO_thumbnail : Picture
var $vR_tile_w; $vR_tile_h; $vR_border; $vR_count_width; $vR_count_height; $vR_x; $vR_y; $vR_x_sel; $vR_y_sel; $vR_square_w; $vR_square_h; $vR_coef_stroke; $vR_stroke_w; $vR_stroke_h; $vR_stroke; $vR_strokeD2_w; $vR_strokeD2_h; $vR_rect_x; $vR_rect_y; $vR_rect_w; $vR_rect_h; $vR_rx; $vR_ry; $vR_cx; $vR_cy : Real
var $vT_svg_title; $vT_svg_root; $vT_shape_rendering; $vT_svg_object; $vT_patt_none_name; $vT_color_stroke; $vT_color_svg; $vT_tile; $vT_tileRef; $vT_svg_b : Text
If ($vL_shape<=0)
	$vL_shape:=1  // Rect
End if 


$vL_svg_scale:=wmd__storage_prefs.l_svg_scale
x_widthHeight_Object($vP_canvas; ->$vL_width; ->$vL_height; $vL_svg_scale)

$vJ_space_md:=wmd__storage_space_md
$vC_al_break:=$vJ_space_md.al_break
$is_aL_break:=($vC_al_break#Null:C1517)
$vC_al_colorRGB:=$vJ_space_md.colorRGB
$vL_count_colors:=$vC_al_colorRGB.length

$vL_count_w:=$vJ_space_md.count_w

Case of 
	: ($is_aL_break)  // Break table
		$vL_count_w:=0
		$vL_count_h:=0
		$vL_break_last:=0
		For each ($vL_break; $vC_al_break)
			$vL_count_h+=1
			$vL_count_w:=wox_max($vL_count_w; $vL_break-$vL_break_last)
			$vL_break_last:=$vL_break
		End for each 
		$vR_tile_w:=$vL_width/$vL_count_w
		$vR_tile_h:=$vL_height/$vL_count_h
		$vL_break_idx:=0
		$vL_break:=$vC_al_break[$vL_break_idx]  // Start break
		
	: ($vL_count_w=0)  // Based on surface -> Square root
		$vL_surface:=$vL_width*$vL_height
		$vL_surface_square:=$vL_surface/$vL_count_colors
		$vR_border:=Square root:C539($vL_surface_square)
		$vR_count_width:=$vL_width\$vR_border
		$vR_count_height:=$vL_count_colors/$vR_count_width
		If (($vR_count_height-Int:C8($vR_count_height))>0)
			$vR_count_height:=Int:C8($vR_count_height)+1
		End if 
		//$vR_border_w:=$vR_count_width
		$vR_tile_w:=$vL_width/$vR_count_width
		$vR_tile_h:=$vL_height/$vR_count_height
		
	Else   // based on $vL_count_w
		$vR_count_height:=$vL_count_colors\$vL_count_w
		If (($vL_count_colors%$vL_count_w)#0)
			$vR_count_height+=1
		End if 
		$vR_tile_w:=$vL_width/$vL_count_w
		$vR_tile_h:=$vL_height/$vR_count_height
End case 

$vT_svg_title:="svg_colors"
$vT_svg_root:=SVG_New($vL_width; $vL_height; $vT_svg_title; $vT_svg_title; True:C214; Truncated centered:K6:1)
$vT_shape_rendering:=wmd__storage_prefs().t_svg_rendering  // "auto", "optimizeSpeed", "crispEdges", "geometricPrecision" or "inherit"
SVG_SET_SHAPE_RENDERING($vT_svg_root; $vT_shape_rendering)
$vT_svg_object:=SVG_New_rect($vT_svg_root; 0; 0; $vL_width; $vL_height; 0; 0; "none"; "white")
SVG_SET_ID($vT_svg_object; "root")

$vT_patt_none_name:="nonePattern"
wmd_svg_pattern_empty($vT_svg_root; $vT_patt_none_name)
//$vT_RectRef:=SVG_New_rect($vT_svg_ref; 0; $vL_height1; $vL_width; $vL_none_height; 0; 0; "none"; "url(#"+$vT_patt_none_name+")")  //; 2*$vL_svg_scale)
//SVG_SET_ID($vT_RectRef; "c_none")

// *
// ***** is_sf manager
// *
If ($is_sf)
	wmd_md_colors_to_sf($vL_colors; ->$vL_stroke_color; ->$vL_fill_color)
	$vL_stroke_index:=$vL_stroke_color
	$vL_fill_index:=$vL_fill_color
	$vL_index:=$is_stroke ? $vL_stroke_color : $vL_fill_color
Else 
	$vL_stroke_index:=-1  // NC
	$vL_fill_index:=$vL_colors
	$vL_index:=$vL_fill_index
End if 

$vR_x:=0
$vR_y:=0
$vR_x_sel:=-1
$vR_y_sel:=-1
$vL_r:=0
$vR_square_w:=$vR_tile_w-$vL_svg_scale
$vR_square_h:=$vR_tile_h-$vL_svg_scale

// ========= CURSORS
$c4Fo_sf:=Folder:C1567(fk resources folder:K87:11).folder("icons")

$vL_idx:=0
For each ($vL_color_rgb; $vC_al_colorRGB)
	$is_transparent:=($vL_color_rgb=Background color none:K23:10)
	If ($is_transparent)
		$vL_color_rgb:=0x00FFFFFF
	End if 
	
	If ($vL_index=$vL_idx)
		$is_white_color:=wmd_rgb_isWhiteFor($vL_color_rgb)
		$vT_color_stroke:=$is_white_color ? "white" : "black"
		
		$vR_coef_stroke:=0.07
		$vR_stroke_w:=$vR_square_w*$vR_coef_stroke
		$vR_stroke_h:=$vR_square_h*$vR_coef_stroke
		$vR_stroke:=($vR_stroke_w>$vR_stroke_h) ? $vR_stroke_w : $vR_stroke_h
		$vR_strokeD2_w:=$vR_stroke_w/2
		$vR_strokeD2_h:=$vR_stroke_h/2
		$vR_rect_x:=$vR_x+$vR_strokeD2_w
		$vR_rect_y:=$vR_y+$vR_strokeD2_h
		$vR_rect_w:=$vR_square_w-$vR_stroke_w
		$vR_rect_h:=$vR_square_h-$vR_stroke_h
	Else 
		$vR_stroke:=0
		$vT_color_stroke:=k_none
		$vR_rect_x:=$vR_x
		$vR_rect_y:=$vR_y
		$vR_rect_w:=$vR_square_w
		$vR_rect_h:=$vR_square_h
	End if 
	
	If ($is_transparent)
		$vT_color_svg:="url(#"+$vT_patt_none_name+")"
		$vT_tile:="c_none"
	Else 
		$vT_color_svg:=wmd_rgb_to_svg($vL_color_rgb)
		$vT_tile:="c_"+String:C10($vL_idx)
	End if 
	
	//If ($is_rect)
	//$vT_tileRef:=SVG_New_rect($vT_svg_ref; $vR_rect_x; $vR_rect_y; $vR_rect_w; $vR_rect_h; $vL_r; $vL_r; $vT_color_stroke; $vT_color_svg; $vR_stroke)
	//Else
	//$vR_rx:=$vR_rect_w/2
	//$vR_ry:=$vR_rect_h/2
	//$vR_cx:=$vR_rect_x+$vR_rx
	//$vR_cy:=$vR_rect_y+$vR_ry
	//$vT_tileRef:=SVG_New_ellipse($vT_svg_ref; $vR_cx; $vR_cy; $vR_rx; $vR_ry; $vT_color_stroke; $vT_color_svg; $vR_stroke)
	//End if
	$vR_rx:=$vR_rect_w/2
	$vR_ry:=$vR_rect_h/2
	$vR_cx:=$vR_rect_x+$vR_rx
	$vR_cy:=$vR_rect_y+$vR_ry
	$vT_tileRef:=wmd_svg_object($vT_svg_root; $vL_shape; $vR_cx; $vR_cy; $vR_rx; $vR_ry; $vT_color_stroke; $vT_color_svg; $vR_stroke)
	SVG_SET_ID($vT_tileRef; $vT_tile)
	
	// Add sf icons
	//If ($vL_space_color=$vL_space)
	If ($is_sf)
		$is_stroke:=($vL_stroke_index=$vL_idx)
		$is_fill:=($vL_fill_index=$vL_idx)
		
		$is_img:=$is_stroke || $is_fill
		If ($is_img)  //& False
			$is_white:=wmd_rgb_isWhiteFor($vL_color_rgb)
			$vO_thumbnail:=_colourWidget_sf_icon($is_stroke; $is_fill; $is_white; $vR_square_w; $vR_square_h; $c4Fo_sf)
			$vT_svg_b:=SVG_New_embedded_image($vT_svg_root; $vO_thumbnail; $vR_x; $vR_y)
		End if 
	End if 
	
	
	If ($is_aL_break)
		If ($vL_idx=($vL_break-1))
			$vL_break_idx+=1
			If ($vL_break_idx<$vC_al_break.length)
				$vL_break:=$vC_al_break[$vL_break_idx]  // Start break
				$vR_x:=0
				$vR_y+=$vR_tile_h
			Else 
				$vR_x+=$vR_tile_w  // For transparent !
			End if 
		Else 
			$vR_x+=$vR_tile_w
		End if 
	Else 
		$vR_x+=$vR_tile_w
		If ($vR_x>($vL_width-$vR_tile_w))
			$vR_x:=0
			$vR_y+=$vR_tile_h
		End if 
	End if 
	$vL_idx+=1
End for each 

$vP_canvas->:=SVG_Export_to_picture($vT_svg_root; 0)
SVG_CLEAR($vT_svg_root)


