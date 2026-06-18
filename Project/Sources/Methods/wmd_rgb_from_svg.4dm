//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// ----------------------------------------------------
// Project method : Color_to_long
// Database: 4D Labels
// ID[D6AEFA2DB6864C9D967EEEC4C035D503]
// Created #10-2-2015 by Vincent de Lachaux
// ----------------------------------------------------
// Description:
//
// ----------------------------------------------------
// Declarations

#DECLARE($vT_color_svg : Text; $is_fill : Boolean)->$vL_color : Integer  // {#2} optionals 
var $vL_R; $vL_G; $vL_B : Integer
var $vT_kTxt_pattern : Text
If (Count parameters:C259<2)
	$is_fill:=True:C214
End if 

$vT_kTxt_pattern:="rgb\\((\\d*),(\\d*),(\\d*)\\)"

ARRAY LONGINT:C221($aL_length; 0)
ARRAY LONGINT:C221($aL_position; 0)

Case of 
		
	: (Match regex:C1019($vT_kTxt_pattern; $vT_color_svg; 1; $aL_position; $aL_length))
		$vL_R:=Num:C11(Substring:C12($vT_color_svg; $aL_position{1}; $aL_length{1}))
		$vL_G:=Num:C11(Substring:C12($vT_color_svg; $aL_position{2}; $aL_length{2}))
		$vL_B:=Num:C11(Substring:C12($vT_color_svg; $aL_position{3}; $aL_length{3}))
		$vL_color:=wmd_rgb_from_r_g_b($vL_R; $vL_G; $vL_B)
		
	: ($vT_color_svg="none") & ($is_fill)
		$vL_color:=-1
		
	: ($vT_color_svg="black")
		$vL_color:=0x0000
		
	: ($vT_color_svg="white")
		$vL_color:=0x00FFFFFF
		
		
	Else 
		$vL_color:=Choose:C955($is_fill; 0x0000; 0x00FFFFFF)
		
End case 

