//%attributes = {"invisible":true,"lang":"en"}

#DECLARE($vL_color : Integer; $vJ_space_md : Object)->$vT_infos : Text

If ($vJ_space_md=Null:C1517)
	$vJ_space_md:=wmd__storage_space_md
End if 

var $vC_al_colorRGB : Collection
var $tt : Integer
$vC_al_colorRGB:=$vJ_space_md.colorRGB
$tt:=$vC_al_colorRGB.length
If ($vL_color>=$tt)
	$vT_infos:="[md:inex]"
Else 
	var $vL_column; $vL_row : Integer
	wmd_md_color_to_rowCol($vL_color; ->$vL_row; ->$vL_column)
	If ($vL_row#-1) && ($vL_column#-1)
		$vT_infos:="[md:"+String:C10($vL_color)+"]⇢"+$vJ_space_md.colorName[$vL_row]+" "+$vJ_space_md.at_density[$vL_column]
	Else 
		$vT_infos:="[md:none]"
	End if 
End if 


