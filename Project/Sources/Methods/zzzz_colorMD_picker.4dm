//%attributes = {"lang":"en","invisible":true}
// Project Method: zzzz_colorMD_picker
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

var $is_popup; $isOk; $is_strokeFill : Boolean
var $vL_colors; $vL_color_stroke; $vL_color_fill; $vL_color; $vL_rgb : Integer
var $vJ_prefs : Object
var $vT_refMenu; $vT_menu; $vT_menu_param : Text
wmd_initRegister()

If (Right click:C712) || True:C214
	$vJ_prefs:=wmd__storage_prefs
	$is_popup:=$vJ_prefs.is_popup
	$isOk:=wmd__options_menu(->$is_popup)
	$isOk:=False:C215  // No Color chooser after !
Else 
	$isOk:=True:C214
End if 

If ($isOk)
	If ($is_popup)
		$vL_colors:=k_MDcolorsAppPrimary
		wmd_md_colors_to_sf($vL_colors; ->$vL_color_stroke; ->$vL_color_fill)
		$vT_refMenu:=Create menu:C408
		wmd_md_color_menu_create($vL_color_stroke; "stroke"; "Stroke"; $vT_refMenu)
		wmd_md_color_menu_create($vL_color_fill; "fill"; "Fill"; $vT_refMenu)
		$vT_menu:=Dynamic pop up menu:C1006($vT_refMenu)
		RELEASE MENU:C978($vT_refMenu)
		
		Case of 
			: (Length:C16($vT_menu)=0)  //NO CHOICE
				
			: ($vT_menu="stroke-color-@")
				$vT_menu_param:=Replace string:C233($vT_menu; "stroke-color-"; ""; 1)
				$is_strokeFill:=True:C214
				$vL_color:=$vL_color_stroke
				
			: ($vT_menu="fill-color-@")
				$vT_menu_param:=Replace string:C233($vT_menu; "fill-color-"; ""; 1)
				$is_strokeFill:=False:C215
				$vL_color:=$vL_color_fill
				
				Case of 
					: ($vT_menu_param="none")
						$vL_color:=k_MDcolorTransparent
						
					: ($vT_menu_param="picker")
						$vL_rgb:=wmd_md_color_to_rgb($vL_color)
						$vL_color:=wmd_md_color_from_rgb(Select RGB color:C956($vL_rgb))
					Else 
						$vL_color:=Num:C11($vT_menu_param)
				End case 
				
				If ($is_strokeFill)
					$vL_colors:=wmd_md_colors_from_sf($vL_color; $vL_color_fill)
				Else 
					$vL_colors:=wmd_md_colors_from_sf($vL_color_stroke; $vL_color)
				End if 
				
		End case 
		
	Else 
		//$ob:=OB Copy(Form)
		//$isOk:=gsw_colourPicker_ob($ob)
		//If ($isOk)
		//gsw_setProperties($ob;Form;"color";"colour";"colourRGB";"colourName")
		//End if
		
	End if 
End if 

If ($isOk)
	
End if 

