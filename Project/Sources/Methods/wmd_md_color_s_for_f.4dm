//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}


#DECLARE($vL_fill : Integer)->$vL_stroke : Integer  //  #GUESSED: $TO_CHECK

var $is_strokeWhite : Boolean
$is_strokeWhite:=wmd_md_color_isWhite_for($vL_fill)
$vL_stroke:=Choose:C955($is_strokeWhite; k_MDcolorWhite; k_MDcolorBlack)


