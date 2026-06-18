//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// Project Method: wmd_md_color_from_text
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 04/01/2023   OG   Initial version.

#DECLARE($vT_txt : Text)->$vL_color : Integer
var $isOk : Boolean
var $k; $k1; $k2 : Integer
var $vT_space : Text
$vL_color:=-1

$k:=wox_max(0; Position:C15("["; $vT_txt))
$k1:=Position:C15("]"; $vT_txt; $k+1)
If ($k1<=0)
	$k1:=Length:C16($vT_txt)
End if 
$isOk:=($k1<=11)  // Max [ssss:iiii]
If ($isOk)
	$k2:=Position:C15(":"; $vT_txt)
	$isOk:=($k2>1)
	If ($isOk)
		$vT_space:=Substring:C12($vT_txt; $k+1; $k2-$k-1)
		$isOk:=($vT_space="md")
		If ($isOk)
			$vL_color:=Num:C11(Substring:C12($vT_txt; $k2+1; $k1-$k2-1))
		End if 
	End if 
End if 

