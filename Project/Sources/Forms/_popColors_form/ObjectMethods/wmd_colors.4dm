
var $vJ_widget : Object
var $vL_event_code : Integer
$vJ_prefs:=Form:C1466.j_prefs

$vL_event_code:=Form event code:C388
Case of 
	: ($vL_event_code=On Load:K2:1)
		$vJ_widget:=Self:C308->
		$vJ_widget.is_inForm:=True:C214
		
		$vJ_widget.l_colors:=$vJ_prefs.l_colors
		$vJ_widget.is_sf:=True:C214
		$vJ_widget.is_stroke:=$vJ_prefs.is_stroke
		$vJ_widget.resize()
		$vJ_widget.redraw()
		
		
	: ($vL_event_code=k_OnDataChange) || ($vL_event_code=-1000)
		$vJ_widget:=Self:C308->
		wox_vJ_overloads($vJ_widget; $vJ_prefs; "l_colors"; "is_stroke")  //; "space")
		Form:C1466.fc._colorChange()
		$is_resize:=True:C214
		
		
	: ($vL_event_code=(k_OnDoubleClicked))
		$vJ_widget:=Self:C308->
		wox_vJ_overloads($vJ_widget; $vJ_prefs; "l_colors"; "is_stroke")  //; "space")
		ACCEPT:C269
		
		
End case 






