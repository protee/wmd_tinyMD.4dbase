
var $vL_event_code : Integer
var $vJ_widget : Object
var $vT_wmd_colors : Text
$vT_wmd_colors:="wmd_colors"

$vL_event_code:=Form event code:C388
Case of 
	: ($vL_event_code=On Load:K2:1)
		
		
	: ($vL_event_code=On Data Change:K2:15)
		//Form.date:=wog_getValue_date
		
		
	: ($vL_event_code=On Close Box:K2:21) || ($vL_event_code=On Deactivate:K2:10)
		$vJ_widget:=OBJECT Get value:C1743($vT_wmd_colors)  // Save on close box
		Form:C1466.l_colors:=$vJ_widget.l_colors
		ACCEPT:C269
		
End case 

