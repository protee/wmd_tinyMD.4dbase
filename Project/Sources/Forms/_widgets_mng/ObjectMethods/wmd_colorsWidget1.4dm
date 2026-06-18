
var $vL_event_code; $vL_color : Integer
var $vJ_widget : Object

$vL_event_code:=Form event code:C388
Case of 
	: ($vL_event_code=On Load:K2:1)
		$vJ_widget:=Self:C308->
		$vL_color:=55
		$vJ_widget.l_colors:=$vL_color
		$vJ_widget.is_sf:=False:C215
		$vJ_widget.resize()
		$vJ_widget.redraw()
		
		
	: ($vL_event_code=k_OnDataChange)
		$vJ_widget:=Self:C308->
		$vL_color:=$vJ_widget.l_colors
		
End case 

OBJECT SET VALUE:C1742("oO_icns"; wmd_md_color_get_icns($vL_color))
OBJECT SET VALUE:C1742("oO_icn"; wmd_md_color_get_icn($vL_color))
OBJECT SET VALUE:C1742("oO_icnm"; wmd_md_color_get_icnm($vL_color))

