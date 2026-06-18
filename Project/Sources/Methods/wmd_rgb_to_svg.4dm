//%attributes = {"shared":true,"preemptive":"capable","lang":"en"}

// Project Method: wmd_rgb_to_svg
//
// Parameter Type    Description
// $1        LONGINT rgb value
// {$2}      Text    Colour name, check if "none" for same answer.
//
// $0        Text    Form "rgb(r,g,b)" or "none".
//
// Description:
// Convert Red green blue to an rgb(r,g,b) string,
// or "none" regarding colour if passed
//
// Date        Init  Description
// ===================================================================
// 22/02/2021   OG   Initial version.

#DECLARE($vL_rgb : Integer; $vL_kind : Integer)->$vT_color : Text
var $vL_red; $vL_green; $vL_blue : Integer

If ($vL_rgb=Background color none:K23:10)
	$vT_color:=k_none
Else 
	
	Case of 
		: $vL_kind=0  // kind 0 "rgb(r,g,b)" // Default
			wmd_rgb_to_r_g_b($vL_rgb; ->$vL_red; ->$vL_green; ->$vL_blue)
			$vT_color:="rgb("+String:C10($vL_red)+","+String:C10($vL_green)+","+String:C10($vL_blue)+")"
			
		: $vL_kind=1  // kind 1 "#rgb"
			$vT_color:=wmd_rgb_to_html($vL_rgb; True:C214; True:C214)
			
		: $vL_kind=2  // kind 2 "#rrggbb"
			$vT_color:=wmd_rgb_to_html($vL_rgb; True:C214)
			
		: $vL_kind=3  // kind 3 "rgb(r%,g%,b%)"
			wmd_rgb_to_r_g_b($vL_rgb; ->$vL_red; ->$vL_green; ->$vL_blue)
			$vT_color:="rgb("+String:C10(Int:C8($vL_red*100\255))+"%,"+String:C10(Int:C8($vL_green*100\255))+"%,"+String:C10(Int:C8($vL_blue*100\255))+"%)"
			
		Else 
			wmd_rgb_to_r_g_b($vL_rgb; ->$vL_red; ->$vL_green; ->$vL_blue)
			$vT_color:="rgb("+String:C10($vL_red)+","+String:C10($vL_green)+","+String:C10($vL_blue)+")"
	End case 
End if 



