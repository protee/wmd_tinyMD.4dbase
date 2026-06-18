
var $vJ_widget : Object

var $vL_event_code : Integer
$vL_event_code:=Form event code:C388
Case of 
	: ($vL_event_code=On Load:K2:1)
		$vJ_widget:=Self:C308->
		$vJ_widget.is_inForm:=True:C214
		
		$vJ_widget.l_colors:=Form:C1466.l_colors
		$vJ_widget.is_sf:=Form:C1466.is_sf
		$vJ_widget.is_stroke:=Form:C1466.is_stroke
		$vJ_widget.resize()
		$vJ_widget.redraw()
		
		
	: ($vL_event_code=(k_OnDataChange-1))
		$vJ_widget:=Self:C308->
		Form:C1466.l_colors:=$vJ_widget.l_colors  //("wog_colors")
		ACCEPT:C269
		
		
End case 






