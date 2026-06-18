//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}


#DECLARE($vL_color : Integer; $vL_kind : Integer)->$vT_color : Text

var $vL_color_rgb : Integer
$vL_color_rgb:=wmd_md_color_to_rgb($vL_color; True:C214)
$vT_color:=$vL_color_rgb=Background color none:K23:10 ? k_none : wmd_rgb_to_svg($vL_color_rgb; $vL_kind)

