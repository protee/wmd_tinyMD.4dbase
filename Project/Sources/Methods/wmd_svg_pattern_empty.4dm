//%attributes = {"shared":true,"preemptive":"capable","lang":"en"}
// Project Method: wmd_svg_pattern_empty
//
// Parameter Type Description
//
//
// Description:
// 
//
// Date        Init  Description
// ===================================================================
// 22/06/2022   OG   Initial version.


#DECLARE($vT_svg_root : Text; $vT_patt_name : Text)->$vT_svg_pattern : Text  // {#3}

var $vL_pat_width; $vL_pat_height : Integer
var $vO_picEmpty : Picture
var $vT_object; $vT_path_picEmpty : Text
$vT_path_picEmpty:=Get 4D folder:C485(Current resources folder:K5:16)+"patterns"+Folder separator:K24:12+"icns_emptyPtn"+k_png_ext
READ PICTURE FILE:C678($vT_path_picEmpty; $vO_picEmpty)
PICTURE PROPERTIES:C457($vO_picEmpty; $vL_pat_width; $vL_pat_height)
$vT_svg_pattern:=SVG_Define_pattern($vT_svg_root; $vT_patt_name; $vL_pat_width; $vL_pat_height; 0; 0; ""; "0 0 "+String:C10($vL_pat_width)+" "+String:C10($vL_pat_height))
$vT_object:=SVG_New_embedded_image($vT_svg_pattern; $vO_picEmpty; 0; 0)


