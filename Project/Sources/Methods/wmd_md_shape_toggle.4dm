//%attributes = {"shared":true,"preemptive":"capable","lang":"en"}

#DECLARE($is_value : Boolean; $vL_colorsRow : Integer; $vL_shape : Integer; $vL_size : Integer)->$vO_picture : Picture
var $vL_colors : Integer

$vL_colorsRow:=Count parameters:C259<2 ? k_MDcolorsIdx_lightGreen : $vL_colorsRow
$vL_shape:=$vL_shape#0 ? $vL_shape : 2  // Default circle
$vL_size:=$vL_size=0 ? 9 : $vL_size
$vL_size:=$is_value ? $vL_size : $vL_size-2

$vL_colors:=$is_value ? wmd_md_colors_from_row($vL_colorsRow; 7; 3) : wmd_md_colors_from_row(k_MDcolorsIdx_grey; 5; 1)
$vO_picture:=wmd_md_shape_get($vL_size; $vL_size; $vL_colors; $vL_shape)

