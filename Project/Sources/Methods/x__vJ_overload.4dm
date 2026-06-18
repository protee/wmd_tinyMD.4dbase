//%attributes = {"invisible":true,"lang":"en","preemptive":"capable"}
// Project Method: x__vJ_overload
//
// Parameter Type Description
// $1 <J> Object source
// $2 <J> Object target (to be overwritten)
//
// Description:
// 
//
// Date        Init  Description
// ===================================================================
// 23/02/2021   OG   Initial version.

#DECLARE($vJ_source : Object; $vJ_target : Object)

ARRAY TEXT:C222($aT_keys; 0)
OB GET PROPERTY NAMES:C1232($vJ_source; $aT_keys)
var $isOk : Boolean
var $i; $tt : Integer
var $vT_key : Text
$tt:=Size of array:C274($aT_keys)
For ($i; 1; $tt)
	$vT_key:=$aT_keys{$i}
	$isOk:=($vT_key#"ptr_@")
	If (Not:C34($isOk))
		//$isOk:=Not(Is nil pointer(OB Get($ob_overwrite;$vT_key)))
		$isOk:=(OB Get:C1224($vJ_source; $vT_key)#Null:C1517)
	End if 
	If ($isOk)
		OB SET:C1220($vJ_target; $vT_key; OB Get:C1224($vJ_source; $vT_key))
	End if 
End for 



