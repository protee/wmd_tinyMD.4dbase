//%attributes = {"lang":"en","shared":true}
// Project Method: wmd_md_color_isTransparent
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 17/07/2022   OG   Initial version.

#DECLARE($vL_color : Integer)->$isOk : Boolean
var $vL_index : Integer
var $vJ_space : Object

$vL_index:=$vL_color

$vJ_space:=wmd_md_space_get()  // real space MD
$isOk:=($vL_index=$vJ_space.k_transparent)

