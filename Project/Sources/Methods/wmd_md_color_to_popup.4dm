//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}

#DECLARE($vL_color : Integer)->$vL_popup : Integer
var $vL_row; $vL_column : Integer

wmd_md_color_to_rowCol($vL_color; ->$vL_row; ->$vL_column)
$vL_popup:=$vL_row*14+$vL_column

