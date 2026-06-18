//%attributes = {"shared":true,"lang":"en","preemptive":"incapable"}
// Project Method: wmd_md_color_menu
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

#DECLARE($vP_color : Pointer)->$isOk : Boolean
var $vL_color; $vL_rgb : Integer
var $vT_refMenu; $vT_menu; $vT_menu_param : Text

$vL_color:=$vP_color->
$vT_refMenu:=Create menu:C408
wmd_md_color_menu_create($vL_color; ""; ""; $vT_refMenu)
$vT_menu:=Dynamic pop up menu:C1006($vT_refMenu)
RELEASE MENU:C978($vT_refMenu)
$isOk:=(Length:C16($vT_menu)#0)
If ($isOk)
	If ($vT_menu="color-@")
		$vT_menu_param:=Replace string:C233($vT_menu; "color-"; ""; 1)
		
		Case of 
			: ($vT_menu_param="none")
				$vL_color:=k_MDcolorTransparent
				
			: ($vT_menu_param="picker")
				$vL_rgb:=wmd_md_color_to_rgb($vL_color)
				$vL_color:=wmd_md_color_from_rgb(Select RGB color:C956($vL_rgb))
			Else 
				$vL_color:=Num:C11($vT_menu_param)
		End case 
		$vP_color->:=$vL_color
	End if 
End if 

