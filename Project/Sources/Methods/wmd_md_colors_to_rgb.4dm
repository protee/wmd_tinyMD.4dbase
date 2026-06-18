//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}

#DECLARE($vL_colors : Integer; $vP_vL_stroke_rgb : Pointer; $vP_vL_fill_rgb : Pointer; $is_invert : Boolean)  // {#4} optionals
var $vL_stroke; $vL_fill; $vL_stroke_rgb; $vL_fill_rgb : Integer

wmd_md_colors_to_sf($vL_colors; ->$vL_stroke; ->$vL_fill)

If ($vL_stroke=0)
	$vL_stroke:=wmd_md_color_s_for_f($vL_fill)
	$is_invert:=False:C215
End if 

$vL_stroke_rgb:=wmd_md_color_to_rgb($vL_stroke)
$vL_fill_rgb:=wmd_md_color_to_rgb($vL_fill)

If ($is_invert)
	$vP_vL_stroke_rgb->:=$vL_fill_rgb
	$vP_vL_fill_rgb->:=$vL_stroke_rgb
Else 
	$vP_vL_stroke_rgb->:=$vL_stroke_rgb
	$vP_vL_fill_rgb->:=$vL_fill_rgb
End if 

