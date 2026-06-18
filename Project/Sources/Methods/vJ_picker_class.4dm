//%attributes = {"invisible":true,"preemptive":"incapable","lang":"en"}
// *****
// *
// Method: vJ_picker_class
// Olivier Grimbert — Protée sarl — 13/08/2024 00:30:34
//
// Description: 
//
// Date       | Who | Comment
// 13/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vJ_widget_class : Object)->$is_onLoad : Boolean

var $vP_vJ_widget : Pointer
$vP_vJ_widget:=OBJECT Get pointer:C1124(Object subform container:K67:4)
$is_onLoad:=OB Is empty:C1297($vP_vJ_widget->)
If ($is_onLoad)
	$vP_vJ_widget->:=$vJ_widget_class
	CALL SUBFORM CONTAINER:C1086(-On Load:K2:1)  //usefull if widget not in page 1 main form
End if 


