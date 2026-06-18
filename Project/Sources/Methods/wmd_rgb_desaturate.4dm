//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}


#DECLARE($vL_rgb : Integer)->$vL_answer : Integer
var $vL_r; $vL_g; $vL_b; $vL_max; $vL_min; $l : Integer

wmd_rgb_to_r_g_b($vL_rgb; ->$vL_r; ->$vL_g; ->$vL_b)

$vL_max:=$vL_r
If ($vL_max<$vL_g)
	$vL_max:=$vL_g
End if 
If ($vL_max<$vL_b)
	$vL_max:=$vL_b
End if 

$vL_min:=$vL_r
If ($vL_min>$vL_g)
	$vL_min:=$vL_g
End if 
If ($vL_min>$vL_b)
	$vL_min:=$vL_b
End if 

$l:=($vL_max+$vL_min)/2
$vL_answer:=wmd_rgb_from_r_g_b($l; $l; $l)

