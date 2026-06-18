//%attributes = {"invisible":true,"lang":"en"}
// Project Method: _colourWidget_sf_icon
//
// Parameter Type Description
//
//
// Description:
// 
//
// Date        Init  Description
// ===================================================================
// 06/07/2022   OG   Initial version.

#DECLARE($is_stroke : Boolean; $is_fill : Boolean; $is_white : Boolean; $vR_square_w : Real; $vR_square_h : Real; $c4Fo_sf : 4D:C1709.Folder)->$vO_thumbnail : Picture
var $vL_img_width; $vL_img_height : Integer
var $vR_coefWidth; $vR_coefHeight; $vR_coefImg : Real
var $vT_fileName : Text

Case of 
	: ($is_fill && $is_stroke)
		$vT_fileName:="sf"
		
	: ($is_fill)
		$vT_fileName:="fill"
		
	: ($is_stroke)
		$vT_fileName:="stroke"
End case 


READ PICTURE FILE:C678($c4Fo_sf.file("icn_"+$vT_fileName+String:C10(Num:C11($is_white))+k_png_ext).platformPath; $vO_thumbnail)
PICTURE PROPERTIES:C457($vO_thumbnail; $vL_img_width; $vL_img_height)
$vR_coefWidth:=($vR_square_w)/$vL_img_width
$vR_coefHeight:=($vR_square_h)/$vL_img_height
$vR_coefImg:=$vR_coefWidth
If ($vR_coefWidth>$vR_coefHeight)
	$vR_coefImg:=$vR_coefHeight
End if 
$vR_coefWidth:=$vL_img_width*$vR_coefImg
$vR_coefHeight:=$vL_img_height*$vR_coefImg
CREATE THUMBNAIL:C679($vO_thumbnail; $vO_thumbnail; $vR_coefWidth; $vR_coefHeight)


