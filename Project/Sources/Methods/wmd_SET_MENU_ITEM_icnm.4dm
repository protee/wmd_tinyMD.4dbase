//%attributes = {"shared":true,"lang":"en"}

#DECLARE($vT_refMenu : Text; $vL_item : Integer; $vL_color : Integer; $is_null : Boolean)

var $vT_pathFile : Text
$vT_pathFile:="colors/md/icnm_"+String:C10($vL_color)+k_png_ext
wmd_SET_MENU_ITEM_ICON($vT_refMenu; $vL_item; $vT_pathFile)


