//%attributes = {"lang":"en","invisible":true}


var $vL_colors; $vL_stroke; $vL_fill : Integer

var $vL_offset_color : Integer
$vL_offset_color:=6
$vL_colors:=wmd_md_colors_from_row(k_MDcolorsIdx_blue; $vL_offset_color; 0)
wmd_md_colors_to_sf($vL_colors; ->$vL_stroke; ->$vL_fill)

wmd_md_colors_to_rgb_tr($vL_colors; ->$vL_stroke; ->$vL_fill)


