//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_sp_color_add
// Olivier Grimbert — Protée sarl — 22/08/2024 20:16:44
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_color : Integer; $vL_offset : Integer)->$vL_color_out : Integer  // {#2} optionals

var $vL_idColor; $idxColor; $vL_idyColor : Integer
var $vL_offX; $idxModulo; $vL_idyModulo : Integer
var $idxOffset; $vL_idyOffset : Integer
var $isIdxHigh : Boolean

If ($vL_offset=0) | ($vL_color=k_MDcolorWhite) | ($vL_color=k_MDcolorTransparent)
	$vL_color_out:=$vL_color
	
Else 
	$vL_idColor:=wmd_md_color_to_popup($vL_color)
	
	$idxColor:=$vL_idColor%14
	$vL_idyColor:=$vL_idColor\14
	
	// 16 fois 10 + 4
	// 1 fois 10
	// 1 fois 10 + blanc => inchangé
	// 1 fois 10 + transparent => inchangé
	
	$isIdxHigh:=($idxColor>=10)
	//$isIdyLow:=($idyColor<16)
	
	If ($isIdxHigh)
		$vL_offX:=10
		$idxModulo:=4
		$vL_idyModulo:=16
		$idxColor:=$idxColor-$vL_offX
	Else 
		$vL_offX:=0
		$idxModulo:=10
		$vL_idyModulo:=19
	End if 
	
	$idxOffset:=$vL_offset%$idxModulo
	$vL_idyOffset:=$vL_offset\$idxModulo
	$idxColor:=$idxColor+$idxOffset
	If ($idxColor>=$idxModulo)
		$idxColor:=$idxColor-$idxModulo
		$vL_idyOffset:=$vL_idyOffset+1
	End if 
	If ($isIdxHigh)
		$idxColor:=$idxColor+$vL_offX
	End if 
	$vL_idyColor:=($vL_idyColor+$vL_idyOffset)%$vL_idyModulo
	
	$vL_color_out:=wmd_md_color_from_popup($vL_idyColor*14+$idxColor)
	
End if 


