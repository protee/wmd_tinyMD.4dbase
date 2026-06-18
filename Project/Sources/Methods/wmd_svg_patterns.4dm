//%attributes = {"shared":true,"lang":"en"}
// Project Method: wmd_svg_patterns
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

#DECLARE($vT_svg_root : Text; $vT_patt_name : Text; $vL_pattern : Integer; $vT_stroke_color : Text; $vT_fill_color : Text; $vL_size : Integer)->$vT_svg_pattern : Text
var $vC_patterns : Collection
var $vL_pat_width; $vL_pat_height; $vL_svg_scale; $vL_pat_widthD2; $vL_pat_heightD2 : Integer
var $vJ_prefs; $vJ_pattern : Object
var $vT_object; $vT_pattern; $vT_svg_path : Text

// ***** DRAW PATTERN
// *

Case of 
	: ($vL_pattern=0)
		$vL_size:=($vL_size=0) ? 8 : $vL_size
		$vL_pat_width:=$vL_size
		$vL_pat_height:=$vL_size
		$vT_svg_pattern:=SVG_Define_pattern($vT_svg_root; $vT_patt_name; $vL_pat_width; $vL_pat_height; 0; 0; ""; "0 0 "+String:C10($vL_pat_width)+" "+String:C10($vL_pat_height))
		$vT_object:=SVG_New_rect($vT_svg_pattern; 0; 0; $vL_pat_width; $vL_pat_height; 0; 0; k_none; k_none; 0)
		
	: ($vL_pattern=1)
		If ($vL_size=0)
			$vJ_prefs:=wmd__storage_prefs()
			$vL_svg_scale:=$vJ_prefs.l_svg_scale
			$vL_size:=$vJ_prefs.l_tr_size
			$vL_size:=$vL_size*$vL_svg_scale
		End if 
		$vL_pat_width:=$vL_size
		$vL_pat_height:=$vL_size
		$vT_svg_pattern:=SVG_Define_pattern($vT_svg_root; $vT_patt_name; $vL_pat_width; $vL_pat_height; 0; 0; ""; "0 0 "+String:C10($vL_pat_width)+" "+String:C10($vL_pat_height))
		$vT_object:=SVG_New_rect($vT_svg_pattern; 0; 0; $vL_pat_width; $vL_pat_height; 0; 0; k_none; k_none; 0)
		$vL_pat_widthD2:=$vL_pat_width/2
		$vL_pat_heightD2:=$vL_pat_height/2
		$vT_object:=SVG_New_rect($vT_svg_pattern; 0; 0; $vL_pat_widthD2; $vL_pat_heightD2; 0; 0; k_none; $vT_stroke_color; 0)
		$vT_object:=SVG_New_rect($vT_svg_pattern; $vL_pat_widthD2; $vL_pat_heightD2; $vL_pat_widthD2; $vL_pat_heightD2; 0; 0; k_none; $vT_stroke_color; 0)
		$vT_object:=SVG_New_rect($vT_svg_pattern; 0; $vL_pat_heightD2; $vL_pat_widthD2; $vL_pat_heightD2; 0; 0; k_none; $vT_fill_color; 0)
		$vT_object:=SVG_New_rect($vT_svg_pattern; $vL_pat_widthD2; 0; $vL_pat_widthD2; $vL_pat_heightD2; 0; 0; k_none; $vT_fill_color; 0)
		
	Else 
		// *
		// ***** FIND PATTERN
		// *
		// * https://www.heropatterns.com/
		$vC_patterns:=wmd_svg_patterns_get
		//$idx:=x_max(0; $vC_patterns.findIndex(Formula($1.value.id=$2); $vL_pattern))
		//$vJ_pattern:=$vC_patterns[$idx]
		$vJ_pattern:=$vC_patterns[$vL_pattern]
		$vL_pat_width:=$vJ_pattern.w
		$vL_pat_height:=$vJ_pattern.h
		$vT_pattern:=$vJ_pattern.d
		
		$vT_svg_pattern:=SVG_Define_pattern($vT_svg_root; $vT_patt_name; $vL_pat_width; $vL_pat_height; 0; 0; ""; "0 0 "+String:C10($vL_pat_width)+" "+String:C10($vL_pat_height))
		$vT_object:=SVG_New_rect($vT_svg_pattern; 0; 0; $vL_pat_width; $vL_pat_height; 0; 0; $vT_fill_color; $vT_fill_color; 0)
		$vT_svg_path:=SVG_New_path($vT_svg_pattern; 0; 0)
		//$vL_pattern:=1
		DOM SET XML ATTRIBUTE:C866($vT_svg_path; "d"; $vT_pattern)
		//SVG_PATH_CLOSE ($Dom_path)
		DOM SET XML ATTRIBUTE:C866($vT_svg_path; "fill-rule"; "evenodd")
		SVG_SET_FILL_BRUSH($vT_svg_path; $vT_stroke_color)
		//SVG_SET_STROKE_BRUSH($vT_svg_path; $vT_stroke_color)
		SVG_SET_STROKE_BRUSH($vT_svg_path; "none")
		//SVG_SET_TRANSFORM_SCALE($vT_svg_path; 0.5; 0.5)
		// *
		// *****
End case 

