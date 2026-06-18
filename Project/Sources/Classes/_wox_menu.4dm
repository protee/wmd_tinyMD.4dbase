
Class constructor
	
Function getMenu($vT_prefix : Text; $vT_refMenu : Text; $is_inline : Boolean)->$vT_refMenu_answer : Text
	var $vC_at_keys : Collection
	var $vT_header : Text
	
	$vC_at_keys:=New collection:C1472()
	$vC_at_keys.push("popColors"; "widgets_mng")
	$vT_header:=""
	$vT_refMenu_answer:=x_at_launch_menu($vT_prefix; $vT_header; $vC_at_keys; $vT_refMenu; $is_inline)
	
	
Function doMenu($vT_answer : Text)->$isOk : Boolean
	var $c4Fu_answer : 4D:C1709.Function
	var $vT_app : Text
	$vT_app:="wmd_"
	$c4Fu_answer:=Formula from string:C1601($vT_app+$vT_answer)
	If ($c4Fu_answer#Null:C1517)
		wox_process_new_fu($c4Fu_answer)
	End if 
	
	
	
	