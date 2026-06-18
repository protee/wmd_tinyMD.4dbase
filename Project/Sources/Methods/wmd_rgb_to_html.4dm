//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_rgb_to_html
// Olivier Grimbert — Protée sarl — 19/04/2026 15:32:39
//
// Description: 
//
// Date       | Who | Comment
// 19/04/2026 | OG  | Updated
// *
// *****

#DECLARE($vL_rgb : Integer; $is_prefix : Boolean; $is_short : Boolean)->$vT_color : Text
var $vL_len : Integer

If ($vL_rgb=Background color none:K23:10)
	$vT_color:=k_none
Else 
	$vL_rgb:=$vL_rgb & 0x00FFFFFF
	$vT_color:=Substring:C12(String:C10($vL_rgb; "&x"); 3)
	$vL_len:=Length:C16($vT_color)
	If ($vL_len>6)
		$vT_color:=Substring:C12($vT_color; ($vL_len-6+1))
	Else 
		If ($vL_len<6)
			$vT_color:="0"*(6-$vL_len)+$vT_color
		End if 
	End if 
	If ($is_short)
		$vT_color:=Substring:C12($vT_color; 1; 1)+Substring:C12($vT_color; 3; 1)+Substring:C12($vT_color; 5; 1)
	End if 
	If ($is_prefix)
		$vT_color:="#"+$vT_color
	End if 
End if 

