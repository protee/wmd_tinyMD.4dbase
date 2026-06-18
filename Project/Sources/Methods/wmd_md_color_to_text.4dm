//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// Project Method: wmd_md_color_to_text
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 04/01/2023   OG   Initial version.

#DECLARE($vL_color : Integer)->$vT_colorRef : Text
var $vL_transparent; $vL_index : Integer
var $vJ_space : Object
var $vT_space; $vT_sep_idxName; $vT_ref : Text

$vJ_space:=wmd__storage_space_md
$vT_space:=$vJ_space.key
$vL_transparent:=$vJ_space.k_transparent

$vT_sep_idxName:="⇢"

$vT_ref:="["+$vT_space+":"+String:C10($vL_color)+"]"
$vT_colorRef:=$vT_ref+$vT_sep_idxName
$vT_colorRef+=($vL_index=$vL_transparent) ? k_none : $vJ_space.colorKey[$vL_color]

