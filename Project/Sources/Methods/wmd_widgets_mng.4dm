//%attributes = {"shared":true,"lang":"en"}

var $c4Fi_prefs : 4D:C1709.File
var $isOk : Boolean
var $vL_window_kind : Integer
var $vJ_prefs; $vJ_form : Object
var $vT_form; $vT_title : Text
var $vP : Pointer

$vT_form:="_widgets_mng"
$c4Fi_prefs:=wmd__prefs_get_c4Fi($vT_form)
$vJ_prefs:=New object:C1471
$isOk:=wox_prefs_load($c4Fi_prefs; ->$vJ_prefs)
$vJ_form:=New object:C1471
$vJ_form.j_prefs:=$vJ_prefs

$vT_title:=wmd__storage_prefs().t_name+" – widgets DEMO"
//Frontmost window for the current process is modal so must open the colour picker window modal also
$vL_window_kind:=Window kind:C445=Modal dialog:K27:2 ? Modal form dialog box:K39:7 : x__window_type()
$isOk:=x_form_xy_open_atMouse($vP; $vT_form; $vL_window_kind; $vT_title; k_form_leftBottom; $vJ_form)
wox_prefs_save($c4Fi_prefs; $vJ_prefs)
