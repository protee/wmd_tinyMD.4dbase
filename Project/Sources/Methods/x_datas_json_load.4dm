//%attributes = {"invisible":true,"lang":"en"}
// Project Method: x_datas_json_load
//
// Parameter Type Description
//
//
// Description:
// 
//
// Date        Init  Description
// ===================================================================
// 19/07/2022   OG   Initial version.

#DECLARE($vT_file : Text)->$vJ_file : Object

var $vT_json; $vT_path : Text
$vT_path:=Get 4D folder:C485(Current resources folder:K5:16)+"datas"+Folder separator:K24:12
$vT_json:=Document to text:C1236($vT_path+$vT_file+".json"; "UTF-8")
$vJ_file:=JSON Parse:C1218($vT_json)


