//%attributes = {"shared":true,"lang":"en","preemptive":"capable"}
// *****
// *
// Method: wmd_md_color_from_popup
// Olivier Grimbert — Protée sarl — 22/08/2024 20:15:51
//
// Description:
//
// Date       | Who | Comment
// 22/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_popup : Integer)->$idx_color : Integer  //  #GUESSED: $idx_color, $vL_popup

var $vL_column; $vL_row : Integer
$vL_row:=$vL_popup\14
$vL_column:=$vL_popup%14
$idx_color:=wmd_md_color_from_rowCol($vL_row; $vL_column)


