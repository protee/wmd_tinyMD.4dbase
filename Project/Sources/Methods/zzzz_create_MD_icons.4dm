//%attributes = {"lang":"en","invisible":true}
// Project Method: zzzz_create_MD_icons
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 16/04/2021   OG   Initial version.

wmd_initRegister

// In "images_md"
var $c4Fo_images : 4D:C1709.Folder
$c4Fo_images:=wmd__storage_stuff.fo_colors
$c4Fo_images.create()

// *
// *****
// *

var $vC_icons : Collection  // srm
var $vJ_icon : Object
$vC_icons:=New collection:C1472
$vJ_icon:=New object:C1471
$vJ_icon.t:="s"
$vJ_icon.w:=9
$vJ_icon.h:=9
$vJ_icon.r:=2
$vC_icons.push($vJ_icon)
$vJ_icon:=New object:C1471
$vJ_icon.t:=""
$vJ_icon.w:=14
$vJ_icon.h:=14
$vJ_icon.r:=3
$vC_icons.push($vJ_icon)
$vJ_icon:=New object:C1471
$vJ_icon.t:="m"
$vJ_icon.w:=24
$vJ_icon.h:=12
$vJ_icon.r:=4
$vC_icons.push($vJ_icon)


var $vJ_space_md : Object
$vJ_space_md:=wmd__storage_space_md
var $vC_al_colorRGB : Collection
var $vL_nbrColors : Integer
$vC_al_colorRGB:=$vJ_space_md.colorRGB
$vL_nbrColors:=$vC_al_colorRGB.length
//$nb_colors:=$nb_colors-1 // None managed separatly

For each ($vJ_icon; $vC_icons)
	var $vL_height; $vL_rxy; $vL_width : Integer
	var $vT_prefix : Text
	$vT_prefix:=$vJ_icon.t
	$vL_width:=$vJ_icon.w
	$vL_height:=$vJ_icon.h
	$vL_rxy:=$vJ_icon.r
	
	var $vL_color; $vL_color_rgb : Integer
	var $vO_picture : Picture
	var $vT_colour_svg; $vT_file_name; $vT_svg_root; $vT_RectRef; $vT_svg_root; $vT_shape_rendering : Text
	var $c4Fi_icn : 4D:C1709.File
	$vL_color:=0
	$vT_shape_rendering:=wmd__storage_prefs().t_svg_rendering  // "auto", "optimizeSpeed", "crispEdges", "geometricPrecision" or "inherit"
	var $vT_svg_title : Text
	$vT_svg_title:="rgb_sample"
	For each ($vL_color_rgb; $vC_al_colorRGB)
		$vT_svg_root:=SVG_New($vL_width; $vL_height; $vT_svg_title; $vT_svg_title; True:C214; Truncated centered:K6:1)
		SVG_SET_SHAPE_RENDERING($vT_svg_root; $vT_shape_rendering)
		If ($vL_color<255)
			$vT_colour_svg:=wmd_md_color_to_svg($vL_color)
			$vT_RectRef:=SVG_New_rect($vT_svg_root; 0; 0; $vL_width; $vL_height; $vL_rxy; $vL_rxy; $vT_colour_svg; $vT_colour_svg)
		Else 
			wmd_svg_pattern_empty($vT_svg_root; "picEmpty")
			var $vT_url_picEmpty : Text
			$vT_url_picEmpty:="url(#picEmpty)"
			$vT_RectRef:=SVG_New_rect($vT_svg_root; 0; 0; $vL_width; $vL_height; $vL_rxy; $vL_rxy; "none"; $vT_url_picEmpty; 0)
		End if 
		$vO_picture:=SVG_Export_to_picture($vT_svg_root; 0)
		SVG_CLEAR($vT_svg_root)
		$vT_file_name:="icn"+$vT_prefix+"_"+String:C10($vL_color)+".png"
		$c4Fi_icn:=$c4Fo_images.file($vT_file_name)
		WRITE PICTURE FILE:C680($c4Fi_icn.platformPath; $vO_picture; ".png")
		$vL_color+=1
	End for each 
	
End for each 


