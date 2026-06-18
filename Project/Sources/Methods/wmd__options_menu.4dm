//%attributes = {"shared":true,"lang":"en"}
// Project Method: wmd__options_menu
//
// Parameter Type Description
//
//
// Description:
//
//
// Date        Init  Description
// ===================================================================
// 16/04/2021   OG   Initial version.

#DECLARE($vP_is_popup : Pointer)->$isOk : Boolean

var $vT_menu; $vT_refMenu : Text
$vT_refMenu:=Create menu:C408
wmd__mode_menu_create($vP_is_popup->; "mode"; "Mode"; $vT_refMenu)
//$vL_color:=Form.color
//svgE_MENU_COLOUR ($vL_color;$vT_space;"";$vT_refMenu)
$vT_menu:=Dynamic pop up menu:C1006($vT_refMenu)
RELEASE MENU:C978($vT_refMenu)
$isOk:=(Length:C16($vT_menu)#0)  //NO CHOICE
If ($isOk)
	Case of 
		: ($vT_menu="mode-@")
			$vP_is_popup->:=(Num:C11(Replace string:C233($vT_menu; "mode-"; ""; 1))#0)
			
			//: ($vT_menu="space-@")
			//<>vL_space_palette:=Num(Replace string($vT_menu;"space-";"";1))
	End case 
End if 


