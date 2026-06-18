//%attributes = {"shared":true,"lang":"en"}

#DECLARE($vL_color_rgb : Integer)->$vL_answer_rgb : Integer
var $isWhiteFor : Boolean

$isWhiteFor:=wmd_rgb_isWhiteFor($vL_color_rgb)
$vL_answer_rgb:=$isWhiteFor ? 0x00FFFFFF : 0
