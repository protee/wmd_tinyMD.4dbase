//%attributes = {"shared":true,"lang":"en","preemptive":"incapable"}
// *****
// *
// Method: wmd_md_colors_form
// Olivier Grimbert — Protée sarl — 22/08/2024 20:17:22
//
// Description: 
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vJ_form : Object)->$isOk : Boolean
var $vL_window_type; $vL_window_kind : Integer
var $vT_form; $vT_title : Text
var $vP : Pointer

$vT_form:="colors_form"

//$vL_window_type:=$vJ_form.options.window_type
$vT_title:="Colors MD"
//Frontmost window for the current process is modal so must open the colour picker window modal also
//$vL_window_kind:=Window kind=Modal dialog ? Modal form dialog box : x__window_type()
$vL_window_type:=Plain form window:K39:10
$vL_window_type:=x__window_type($vL_window_type)
$isOk:=x_form_xy_open_atMouse($vP; $vT_form; $vL_window_kind; $vT_title; k_form_leftBottom; $vJ_form)
$isOk:=(OK=1)

