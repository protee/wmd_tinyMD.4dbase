//%attributes = {"shared":true,"lang":"en"}
// Project Method: wmd_svg_patterns_get
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 02/01/2023   OG   Initial version.

#DECLARE()->$vC_patterns : Collection
var $c4Fi_file : 4D:C1709.File
var $vJ_prefs : Object
var $vT_json : Text

$vJ_prefs:=wmd__storage_prefs
$vC_patterns:=$vJ_prefs.aj_patterns
If ($vC_patterns=Null:C1517)
	// Lazyload +
	$c4Fi_file:=Folder:C1567(fk resources folder:K87:11).file("patterns/patterns.json")
	$vT_json:=$c4Fi_file.getText("UTF-8")
	$vC_patterns:=JSON Parse:C1218($vT_json)
	Use ($vJ_prefs)
		$vC_patterns:=$vC_patterns.copy(ck shared:K85:29; $vJ_prefs)
		$vJ_prefs.aj_patterns:=$vC_patterns
	End use 
End if 

