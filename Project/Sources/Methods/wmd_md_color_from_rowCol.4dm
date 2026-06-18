//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_color_from_rowCol
// Olivier Grimbert — Protée sarl — 22/08/2024 20:14:53
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_row : Integer; $vL_column : Integer; $vL_space : Integer)->$vL_index : Integer  // {#3}
var $isOk : Boolean
var $vC_break : Collection
var $tt; $vL_count_w : Integer
var $vJ_space_md : Object

$vL_index:=-1  // Error

$vJ_space_md:=wmd__storage_space_md

$vC_break:=$vJ_space_md.al_break
$tt:=$vC_break.length

$isOk:=($vC_break#Null:C1517)
If ($isOk)
	If ($vL_row<=0)
		$vL_index:=$vL_column
	Else 
		If ($vL_row<$tt)
			$vL_index:=$vC_break[$vL_row-1]+$vL_column
			If ($vL_index>=$vC_break[$vL_row])
				$vL_index:=$vC_break[$tt-1]
			End if 
		Else 
			$vL_index:=$vC_break[$tt-1]
		End if 
	End if 
Else 
	$vL_count_w:=$vJ_space_md.count_w
	$isOk:=($vL_count_w>0)
	If ($isOk)
		$vL_index:=$vL_row*$vL_count_w+$vL_column
	End if 
End if 

