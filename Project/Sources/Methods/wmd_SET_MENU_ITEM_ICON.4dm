//%attributes = {"shared":true,"lang":"en"}
// Project Method: wmd_SET_MENU_ITEM_ICON
//
// Parameter Type Description
//
//
// Description:
// Amazing. The parsing of the pathFile append here,
// and it is stored as absolute path inside the Apple menu.
//
// Date        Init  Description
// ===================================================================
// 16/04/2021   OG   Initial version.

#DECLARE($vT_refMenu : Text; $vL_item : Integer; $vT_pathFile : Text)

var $vT_path_menu : Text
$vT_path_menu:="path:/RESOURCES/"
SET MENU ITEM ICON:C984($vT_refMenu; $vL_item; $vT_path_menu+$vT_pathFile)


