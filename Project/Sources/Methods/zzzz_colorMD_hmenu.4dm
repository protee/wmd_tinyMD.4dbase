//%attributes = {"lang":"en","invisible":true}
// Project Method: zzzz_colorMD_hmenu
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

var $isOk : Boolean
var $vL_color; $vL_colors : Integer
wmd_initRegister()

$vL_color:=k_MDcolorGrey
$isOk:=wmd_md_color_hmenu(->$vL_color)

$vL_colors:=k_MDcolorsAppPrimary
$isOk:=wmd_md_colors_hmenu(->$vL_colors)

