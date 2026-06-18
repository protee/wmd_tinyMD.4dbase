//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_color_get_icnx
// Olivier Grimbert — Protée sarl — 21/08/2024 18:28:07
//
// Description:
//
// Date       | Who | Comment
// 21/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_color : Integer; $is_null : Boolean; $vT_type : Text)->$vO_icn : Picture  // {#2} optionals
var $c4Fi_icn : 4D:C1709.File
var $c4Fo_images : 4D:C1709.Folder
var $isNok : Boolean
var $vJ_space : Object

//$vL_color:=$vL_color & 0x00FF
$vJ_space:=wmd_md_space_get()  // real space MD
$isNok:=($vL_color>$vJ_space.k_transparent)

$c4Fo_images:=wmd__storage_stuff.fo_colors

If ($isNok) || (($is_null) && ($vL_color=0))
	$c4Fi_icn:=$c4Fo_images.file("icn"+$vT_type+"_nc.png")
Else 
	$c4Fi_icn:=$c4Fo_images.file("md/icn"+$vT_type+"_"+String:C10($vL_color)+".png")
End if 
READ PICTURE FILE:C678($c4Fi_icn.platformPath; $vO_icn)

