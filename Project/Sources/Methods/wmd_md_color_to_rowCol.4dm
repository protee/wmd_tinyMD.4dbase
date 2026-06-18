//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_color_to_rowCol
// Olivier Grimbert — Protée sarl — 22/08/2024 20:14:36
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_color : Integer; $vP_vL_row : Pointer; $vP_vL_column : Pointer)->$isOk : Boolean
var $vC_break : Collection
var $vL_index; $vL_row; $vL_column; $vL_tile_break_last; $tt_break; $vL_break; $vL_tile_break; $vL_count_w : Integer
var $vJ_space : Object

$vL_index:=$vL_color

$vJ_space:=wmd__storage_space_md
$vC_break:=$vJ_space.al_break

$vL_row:=-1
$vL_column:=-1

$isOk:=($vC_break#Null:C1517)
If ($isOk)
	//$vL_column:=-1
	$vL_row:=0
	$vL_tile_break_last:=0
	$tt_break:=$vC_break.length
	For ($vL_break; 0; $tt_break-1)
		$vL_tile_break:=$vC_break[$vL_break]
		If ($vL_index<$vL_tile_break)
			$vL_column:=$vL_index-$vL_tile_break_last
			break
		Else 
			$vL_tile_break_last:=$vL_tile_break
			$vL_row+=1
		End if 
	End for 
	If ($vL_column<0)
		$vL_column:=$vL_index-$vL_tile_break
	End if 
	
Else 
	$vL_count_w:=$vJ_space.count_w
	$isOk:=($vL_count_w>0)
	If ($isOk)
		$vL_row:=$vL_index\$vL_count_w
		$vL_column:=$vL_index%$vL_count_w
	End if 
End if 
$vP_vL_row->:=$vL_row
$vP_vL_column->:=$vL_column

