//%attributes = {"shared":true,"preemptive":"capable","lang":"en"}
// Project Method: wmd_rgb_isWhiteFor
//
// Parameter <Type> Description
// $1 <L> color_rgb
// $0 <B> isStrokeWhite
//
// Description:
// This method checks the luminance of a given rgb color
// And indicates if you have to draw the text inside in white or in black
//
// Date        Init  Description
//===============================================================================
// 01/02/2021   OG   Initial version.

#DECLARE($vL_colorRGB : Integer)->$isStrokeWhite : Boolean
var $vL_r; $vL_g; $vL_b : Integer
var $vR_y : Real

If ($vL_colorRGB=Background color none:K23:10)
	$isStrokeWhite:=False:C215
Else 
	wmd_rgb_to_r_g_b($vL_colorRGB; ->$vL_r; ->$vL_g; ->$vL_b)
	// https://stackoverflow.com/questions/596216/formula-to-determine-brightness-of-rgb-color
	
	// Digital ITU BT.601 (gives more weight to the R and B components):
	$vR_y:=((0.587*$vL_g)+(0.299*$vL_r)+(0.114*$vL_b))/255
	$isStrokeWhite:=($vR_y<0.6)
	
End if 

