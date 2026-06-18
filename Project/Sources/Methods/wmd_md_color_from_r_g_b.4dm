//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_color_from_r_g_b
// Olivier Grimbert — Protée sarl — 21/08/2024 18:16:13
//
// Description:
//
// Date       | Who | Comment
// 21/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_red : Integer; $vL_green : Integer; $vL_blue : Integer)->$vL_color_idx : Integer
var $vC_al_colorRGB : Collection
var $idx; $vL_color_rgb; $vL_colorPR; $vL_colorPV; $vL_colorPB : Integer
var $vJ_space_md : Object
var $vR_lastDist; $vR_dist : Real

$vJ_space_md:=wmd__storage_space_md
$vC_al_colorRGB:=$vJ_space_md.colorRGB

$idx:=0
$vR_lastDist:=1000000000
$idx:=0
For each ($vL_color_rgb; $vC_al_colorRGB)
	wmd_rgb_to_r_g_b($vL_color_rgb; ->$vL_colorPR; ->$vL_colorPV; ->$vL_colorPB)
	// $dist:=(((($colorR-$colorPR)*0,3)^2)+((($colorV-$colorPV)*0,59)^2)+((($colorB-$colorPB)*0,11)^2))
	//$dist:=abs($colorR-$colorPR)+abs($colorV-$colorPV)+abs($colorB-$colorPB)
	$vR_dist:=((($vL_red-$vL_colorPR)^2)+(($vL_green-$vL_colorPV)^2)+(($vL_blue-$vL_colorPB)^2))
	If ($vR_dist<$vR_lastDist)
		$vR_lastDist:=$vR_dist
		$vL_color_idx:=$idx
	End if 
	$idx+=1
End for each 

