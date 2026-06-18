//%attributes = {"shared":true,"lang":"en","preemptive":"indifferent"}
// Project Method: woc__prefs_get_path
//
// Parameter Type Description
//
//
// Description:
// 
//
// Date        Init  Description
// ===================================================================
// 01/03/2021   OG   Initial version.


#DECLARE($vT_prefs : Text; $is_root : Boolean)->$c4Fi_prefs : 4D:C1709.File
$c4Fi_prefs:=wox_prefs_get_c4Fi(wmd__storage_prefs; $vT_prefs; $is_root)

