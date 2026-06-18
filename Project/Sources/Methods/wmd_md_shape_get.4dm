//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}

// ----------------------------------------------------
// Nom utilisateur (OS) : Olivier Grimbert
// Date et heure : 10/12/17, 17:18:42
// ----------------------------------------------------
// Méthode : wmd_md_shape_get
// Description
//
//
// Paramètres
// ----------------------------------------------------

#DECLARE($vL_width : Integer; $vL_height : Integer; $vL_colors : Integer; $vL_shape : Integer; $vL_stroke : Integer)->$vO_picture : Picture
var $is_bkg_black : Boolean
var $vL_dash; $vL_enablers; $vL_item_width; $vL_item_height; $vL_item_widthShift; $vL_item_heightShift; $x; $y; $vL_fill; $vL_radius; $vL_item_shift; $vL_padding; $vL_item_widthF; $vL_item_heightF; $vL_item_widthS; $vL_item_heightS; $vL_item_radiusF; $vL_item_radiusS; $vL_size : Integer
var $vR_coefOnOff; $vR_cx; $vR_cy; $vR_radius_x; $vR_radius_y : Real
var $vT_svg_root; $vT_shape_rendering; $vT_object; $vT_stroke_color_txt; $vT_fill_color_txt; $vT_color_tr_svg; $txt; $vT_idText : Text

$is_bkg_black:=False:C215


$vT_svg_root:=SVG_New($vL_width; $vL_height)  // Vrai -> viewbox de même taille que le document
$vT_shape_rendering:=wmd__storage_prefs().t_svg_rendering  // "auto", "optimizeSpeed", "crispEdges", "geometricPrecision" or "inherit"
SVG_SET_SHAPE_RENDERING($vT_svg_root; $vT_shape_rendering)
SVG_SET_TRANSFORM_SCALE($vT_svg_root; 1; 1)

SVG_SET_ID($vT_svg_root; "root")  // afin d'avoir accès à la viewBox pour la modifier plus tard

SVG_Define_shadow($vT_svg_root; "ombreDefaut"; 0; 0; 0)
SVG_Define_shadow($vT_svg_root; "ombreSelection")  //;0;0;0)  // aucune ombre par exemple ici pour un élément sélectionné

If ($is_bkg_black)
	$vT_object:=SVG_New_rect($vT_svg_root; 0; 0; $vL_width; $vL_height; 0; 0; "black"; "black"; 1)
End if 

wmd_md_colors_to_svg($vL_colors; ->$vT_stroke_color_txt; ->$vT_fill_color_txt)


$vL_dash:=2

$vR_coefOnOff:=0.8

$vR_cx:=$vL_width/2
$vR_cy:=$vL_height/2

$vT_color_tr_svg:="grey"

If ($vL_shape<0)
	$vL_enablers:=(Count parameters:C259<5) ? 0x0003 : $vL_stroke  // 0x0sf
	$vL_stroke:=1
	
	Case of 
			
			// Squares
			
		: ($vL_shape=-1)
			$vL_item_width:=wox_min($vL_width; $vL_height)*$vR_coefOnOff*3/4
			$vL_item_height:=$vL_item_width
			
			$vL_item_widthShift:=$vL_item_width/4
			$vL_item_heightShift:=$vL_item_widthShift
			If ($vL_enablers ?? 0)
				$x:=$vR_cx-$vL_item_widthShift
				$y:=$vR_cy-$vL_item_heightShift
				$vL_stroke:=Num:C11($vL_fill=k_MDcolorTransparent)
				$vT_object:=SVG_New_rect($vT_svg_root; $x; $y; $vL_item_width; $vL_item_height; 0; 0; $vT_color_tr_svg; $vT_fill_color_txt; $vL_stroke)
				SVG_SET_STROKE_DASHARRAY($vT_object; $vL_dash)
			End if 
			
			If ($vL_enablers ?? 1)
				$x:=$vR_cx+$vL_item_widthShift-$vL_item_width
				$y:=$vR_cy+$vL_item_heightShift-$vL_item_height
				$vL_stroke:=Num:C11($vL_stroke=k_MDcolorTransparent)
				$vT_object:=SVG_New_rect($vT_svg_root; $x; $y; $vL_item_width; $vL_item_height; 0; 0; $vT_color_tr_svg; $vT_stroke_color_txt; $vL_stroke)
				SVG_SET_STROKE_DASHARRAY($vT_object; $vL_dash)
			End if 
			
			
			
			// CIRCLES
			
		: ($vL_shape=-2)
			$vL_radius:=wox_min($vL_width; $vL_height)*$vR_coefOnOff*3/8
			$vL_item_shift:=$vL_radius/4
			
			If ($vL_enablers ?? 0)
				$x:=$vR_cx+$vL_item_shift
				$y:=$vR_cy+$vL_item_shift
				$vL_stroke:=Num:C11($vL_fill=k_MDcolorTransparent)
				$vT_object:=SVG_New_circle($vT_svg_root; $x; $y; $vL_radius; $vT_color_tr_svg; $vT_fill_color_txt; $vL_stroke)
				SVG_SET_STROKE_DASHARRAY($vT_object; $vL_dash)
			End if 
			
			If ($vL_enablers ?? 1)
				$x:=$vR_cx-$vL_item_shift
				$y:=$vR_cy-$vL_item_shift
				$vL_stroke:=Num:C11($vL_stroke=k_MDcolorTransparent)
				$vT_object:=SVG_New_circle($vT_svg_root; $x; $y; $vL_radius; $vT_color_tr_svg; $vT_stroke_color_txt; $vL_stroke)
				SVG_SET_STROKE_DASHARRAY($vT_object; $vL_dash)
			End if 
			
			
			
			// Square
			
		: ($vL_shape=-3)
			//$vL_item_width:=x_min($vL_width; $vL_height)*$vR_coefOnOff
			//$vL_item_height:=$vL_item_width
			$vL_padding:=wox_min($vL_width; $vL_height)*(1-$vR_coefOnOff)
			$vL_item_width:=$vL_width-$vL_padding
			$vL_item_height:=$vL_height-$vL_padding
			
			$vL_item_widthF:=$vL_item_width
			$vL_item_heightF:=$vL_item_height
			$vL_item_widthS:=$vL_item_width/2
			$vL_item_heightS:=$vL_item_height/2
			
			If ($vL_enablers ?? 0)
				$x:=$vR_cx-($vL_item_widthF/2)
				$y:=$vR_cy-($vL_item_heightF/2)
				$vL_stroke:=Num:C11($vL_fill=k_MDcolorTransparent)
				$vT_object:=SVG_New_rect($vT_svg_root; $x; $y; $vL_item_widthF; $vL_item_heightF; 0; 0; $vT_color_tr_svg; $vT_fill_color_txt; $vL_stroke)
				SVG_SET_STROKE_DASHARRAY($vT_object; $vL_dash)
			End if 
			
			If ($vL_enablers ?? 1)
				$x:=$vR_cx-($vL_item_widthS/2)
				$y:=$vR_cy-($vL_item_heightS/2)
				$vL_stroke:=Num:C11($vL_stroke=k_MDcolorTransparent)
				$vT_object:=SVG_New_rect($vT_svg_root; $x; $y; $vL_item_widthS; $vL_item_heightS; 0; 0; $vT_color_tr_svg; $vT_stroke_color_txt; $vL_stroke)
				SVG_SET_STROKE_DASHARRAY($vT_object; $vL_dash)
			End if 
			
			
			// CIRCLE
			
		: ($vL_shape=-4)
			$vL_item_radiusF:=wox_min($vL_width; $vL_height)*$vR_coefOnOff/2
			$vL_item_radiusS:=$vL_item_radiusF/2
			
			If ($vL_enablers ?? 0)
				$vL_stroke:=Num:C11($vL_fill=k_MDcolorTransparent)
				$vT_object:=SVG_New_circle($vT_svg_root; $vR_cx; $vR_cy; $vL_item_radiusF; $vT_color_tr_svg; $vT_fill_color_txt; $vL_stroke)
				SVG_SET_STROKE_DASHARRAY($vT_object; $vL_dash)
			End if 
			
			If ($vL_enablers ?? 1)
				//$vL_stroke:=Num($vL_stroke=k_MDcolorTransparent)
				$vT_object:=SVG_New_circle($vT_svg_root; $vR_cx; $vR_cy; $vL_item_radiusS; $vT_color_tr_svg; $vT_stroke_color_txt; $vL_stroke)
				SVG_SET_STROKE_DASHARRAY($vT_object; $vL_dash)
			End if 
			
			
			// TEXT
		: ($vL_shape=-5)
			$vL_padding:=wox_min($vL_width; $vL_height)*(1-$vR_coefOnOff)
			$vL_item_width:=$vL_width-$vL_padding
			$vL_item_height:=$vL_height-$vL_padding
			$vL_item_widthF:=$vL_item_width
			$vL_item_heightF:=$vL_item_height
			
			If ($vL_enablers ?? 0)
				$vL_stroke:=Num:C11($vL_fill=k_MDcolorTransparent)
				$x:=$vR_cx-($vL_item_widthF/2)
				$y:=$vR_cy-($vL_item_heightF/2)
				//$vL_stroke:=Num($vL_fill=k_MDcolorTransparent)
				$vT_object:=SVG_New_rect($vT_svg_root; $x; $y; $vL_item_widthF; $vL_item_heightF; 0; 0; $vT_color_tr_svg; $vT_fill_color_txt; $vL_stroke)
				SVG_SET_STROKE_DASHARRAY($vT_object; $vL_dash)
			End if 
			If ($vL_enablers ?? 1)
				$vL_size:=$vL_height*2/3
				$txt:="Text"  //$ob_options.text
				If ($vL_stroke=k_MDcolorTransparent)
					$vL_item_radiusS:=wox_min($vL_width; $vL_height)*$vR_coefOnOff/4
					$vT_color_tr_svg:=wmd_md_color_to_svg(wmd_md_color_s_for_f($vL_fill))
					$vT_object:=SVG_New_circle($vT_svg_root; $vR_cx; $vR_cy; $vL_item_radiusS; $vT_color_tr_svg; "none"; 1)
					SVG_SET_STROKE_DASHARRAY($vT_object; $vL_dash)
				Else 
					$vT_idText:=SVG_New_text($vT_svg_root; $txt; $vR_cx; $vR_cy-($vL_size*k_fontOffset_coef); ""; $vL_size; Bold:K14:2; 3; $vT_stroke_color_txt)
					SVG_SET_TEXT_RENDERING($vT_idText; "geometricPrecision")
				End if 
			End if 
	End case 
	
Else 
	$vL_stroke:=(Count parameters:C259<5) ? 1 : $vL_stroke  // Default
	$vR_radius_x:=($vL_width)/2
	$vR_radius_y:=($vL_height)/2
	$vT_object:=wmd_svg_object($vT_svg_root; $vL_shape; $vR_cx; $vR_cy; $vR_radius_x; $vR_radius_y; $vT_stroke_color_txt; $vT_fill_color_txt; $vL_stroke)
End if 

$vO_picture:=SVG_Export_to_picture($vT_svg_root; Get XML data source:K45:16)
SVG_CLEAR($vT_svg_root)

