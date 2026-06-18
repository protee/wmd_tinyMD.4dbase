//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}


#DECLARE($vT_web : Text)->$vL_color_rgb : Integer
var $vL_len; $vL_value; $vL_r; $vL_g; $vL_b : Integer

If (Substring:C12($vT_web; 1; 1)="#")
	$vT_web:=Substring:C12($vT_web; 2)
End if 

$vL_len:=Length:C16($vT_web)
$vL_value:=x_utl_hexaToInt($vT_web)

Case of 
	: ($vL_len=3)
		//$r:=($value >> 8) << 4
		$vL_r:=($vL_value >> 4) & 0x00F0
		$vL_g:=($vL_value & 0x00F0)
		$vL_b:=($vL_value << 4) & 0x00F0
		$vL_color_rgb:=wmd_rgb_from_r_g_b($vL_r; $vL_g; $vL_b)
		
	: ($vL_len=6)
		$vL_color_rgb:=$vL_value
		
	Else 
		$vL_color_rgb:=0x0000
End case 

