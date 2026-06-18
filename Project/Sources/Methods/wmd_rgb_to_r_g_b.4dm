//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}


#DECLARE($vL_color : Integer; $vP_ColorR : Pointer; $vP_ColorV : Pointer; $vP_ColorB : Pointer)

$vP_ColorR->:=($vL_color >> 16) & 0x00FF
$vP_ColorV->:=($vL_color >> 8) & 0x00FF
$vP_ColorB->:=$vL_color & 0x00FF


