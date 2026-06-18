//%attributes = {"invisible":true,"lang":"en","shared":true}
// Project Method: p_woc_colourPop
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 01/03/2021   OG   Initial version.

var $c4Fi_prefs : 4D:C1709.File
var $isOk : Boolean
var $vL_window_kind : Integer
var $vJ_prefs; $vJ_form : Object
var $vP : Pointer
var $vT_form; $vT_title : Text

$vT_form:="_popColors_form"
$c4Fi_prefs:=wmd__prefs_get_c4Fi($vT_form)
$vJ_prefs:=New object:C1471
$isOk:=wox_prefs_load($c4Fi_prefs; ->$vJ_prefs; 2)
If (Not:C34($isOk))
	//$vJ_prefs.l_space:=k_svg_space
	$vJ_prefs.selector:=0
	$vJ_prefs.l_colors:=0
	$vJ_prefs.is_stroke:=True:C214
End if 


$vJ_form:=New object:C1471
$vJ_form.j_prefs:=$vJ_prefs
//$vJ_form.is_ogPop:=True  // Don't display Cancel & Ok Buttons
$vJ_form.is_sf:=True:C214
$vJ_form.is_editing:=True:C214

$vT_title:=wmd__storage_prefs().t_name+" – Colors & Spaces"
//Frontmost window for the current process is modal so must open the colour picker window modal also
$vL_window_kind:=Window kind:C445=Modal dialog:K27:2 ? Modal form dialog box:K39:7 : x__window_type()
$isOk:=x_form_xy_open_atMouse($vP; $vT_form; $vL_window_kind; $vT_title; k_form_leftBottom; $vJ_form)
wox_prefs_save($c4Fi_prefs; $vJ_prefs)

