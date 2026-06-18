//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}

// ----------------------------------------------------
// User name (OS): jpupier
// Date and time: 01/06/07, 08:19:13
// Modified by Roland Lannuzel 01/06/0711:15
// ----------------------------------------------------
// Method: wmd_rgb_to_html_safe
// Description
//
//
// Parameters
#DECLARE($vL_rgb : Integer)->$vL_SafeColor : Integer

// ----------------------------------------------------
ARRAY LONGINT:C221($aL_rgb; 3)

$aL_rgb{1}:=($vL_rgb & 0x00FF0000) >> 16  //RED
$aL_rgb{2}:=($vL_rgb & 0xFF00) >> 8  //GREEN
$aL_rgb{3}:=($vL_rgb & 0x00FF)  //BLUE


ARRAY LONGINT:C221($_SafeColor; 6)
$_SafeColor{1}:=255
$_SafeColor{2}:=204
$_SafeColor{3}:=153
$_SafeColor{4}:=102
$_SafeColor{5}:=51
$_SafeColor{6}:=0


var $i; $j : Integer
For ($i; 1; 3)
	$vL_rgb:=$aL_rgb{$i}
	For ($j; 1; 6)
		$vL_SafeColor:=$_SafeColor{$j}
		
		If ($vL_rgb>=$vL_SafeColor)
			$aL_rgb{$i}:=$vL_SafeColor
			$j:=6
		End if 
	End for 
End for 

$vL_SafeColor:=($aL_rgb{1} << 16)+($aL_rgb{2} << 8)+($aL_rgb{3})


