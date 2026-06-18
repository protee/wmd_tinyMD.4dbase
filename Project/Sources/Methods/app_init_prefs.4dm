//%attributes = {"invisible":true,"lang":"en"}
// *****
// *
// Method: app_init_prefs
// Olivier Grimbert — Protée sarl — 16/08/2024 22:52:42
//
// Description: 
//
// Date       | Who | Comment
// 16/08/2024 | OG  | Updated
// *
// *****

var $vJ_prefs : Object
$vJ_prefs:=wmd__storage_prefs

Use ($vJ_prefs)
	$vJ_prefs.prefs_root:="wmd_tinyMD"  // Root folder for prefs in Document
	
	$vJ_prefs.l_svg_scale:=1
	
	$vJ_prefs.is_md_null:=True:C214
	//$vJ_prefs.l_md_null:=0xFEFF  // BW
	$vJ_prefs.l_md_null:=243 << 8 | 244  // BW
	
	$vJ_prefs.is_popup:=True:C214
	
	$vJ_prefs.l_color_picker:=0  // Default Form ! 1 : default Menu
	$vJ_prefs.t_svg_rendering:="geometricPrecision"  // "auto", "optimizeSpeed", "crispEdges", "geometricPrecision" or "inherit"
	
	
	// *
	// ***** Empty pattern
	// *
	$vJ_prefs.empty_pattern:=3  // Aztec
	$vJ_prefs.empty_colors:=wmd_md_colors_from_sf(207; 206)  // Grey/white pattern
	//$vJ_prefs.empty_colors:=0x331E41B8  // Dark empty pattern
	
	
End use 


