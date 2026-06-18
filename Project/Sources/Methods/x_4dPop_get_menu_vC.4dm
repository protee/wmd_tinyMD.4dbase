//%attributes = {"invisible":true,"lang":"en"}
// Project Method: p_woc_4Dpop_menu_get
//
// Parameter Type Description
//
//
// Description:
// 
//
// Date        Init  Description
// ===================================================================
// 30/11/2022   OG   Initial version.

#DECLARE($is_in_palette : Boolean)->$vC_aj_menu : Collection
$vC_aj_menu:=New collection:C1472
$vC_aj_menu.push(x_4dPop_get_menu_item(True:C214; "popColors"))
$vC_aj_menu.push(x_4dPop_get_menu_item(True:C214; "widgets_mng"))

