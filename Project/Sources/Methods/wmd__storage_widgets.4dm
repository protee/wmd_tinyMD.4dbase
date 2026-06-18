//%attributes = {"shared":true,"preemptive":"capable","lang":"en"}
// *****
// *
// Method: wmd__storage_widgets
// Olivier Grimbert — Protée sarl — 16/08/2024 22:49:37
//
// Description: 
//
// Date       | Who | Comment
// 16/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vT_widget : Text)->$vJ_widgets : Object

$vJ_widgets:=Storage:C1525.j_widgets
If ($vT_widget#"")
	$vJ_widgets:=$vJ_widgets[$vT_widget]
End if 



