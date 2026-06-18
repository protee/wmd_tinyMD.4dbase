// *****
// *
// Class: _woc_colors
// Olivier Grimbert — Protée sarl — 15/08/2024 14:17:44
//
// Description:
//
// Date       | Who | Comment
// 15/08/2024 | OG  | Updated
// *
// *****


Class constructor
	var $isOk : Boolean
	$isOk:=wox_prefs_windows_load()
	This:C1470._colorChange()
	
	
Function _form_events()
	var $vL_event_code : Integer
	var $vJ_formEvent; $vJ_widget : Object
	var $vT_objectName; $vT_widget : Text
	$vJ_formEvent:=FORM Event:C1606
	$vL_event_code:=$vJ_formEvent.code
	$vT_objectName:=$vJ_formEvent.objectName
	
	Case of 
		: ($vL_event_code=On Close Box:K2:21)
			CANCEL:C270
			
			
		: ($vL_event_code=On Unload:K2:2)
			wox_prefs_windows_save()
			
			
		: ($vL_event_code=On Resize:K2:27)
			//$vL_resize:=Form.l_resize
			//If ($vL_resize>0)
			//Form.l_resize:=$vL_resize-1
			//This._get_xy_last()
			//End if 
			//If ($vL_resize>=0)
			//$vL_resize:=-3
			//Else 
			//$vL_resize:=-10
			//End if 
			//Form.l_resize:=$vL_resize
			SET TIMER:C645(-1)
			
			
		: ($vL_event_code=On Timer:K2:25)
			SET TIMER:C645(0)
			$vT_widget:="wmd_colors"
			$vJ_widget:=OBJECT Get value:C1743($vT_widget)
			$vJ_widget.resize()
			$vJ_widget.redraw()
			
			
		: ($vL_event_code=On Clicked:K2:4)
			
			//: ($vL_event_code=On Double Clicked)
			//If ($vT_ObjectName="form_@")
			//This._double_clicked($vT_ObjectName)
			//End if
			
	End case 
	
	
Function _colorChange()
	var $vL_stroke; $vL_fill; $vL_stroke_rgb; $vL_fill_rgb; $vL_for_stroke_rgb; $vL_for_fill_rgb : Integer
	var $vJ_prefs : Object
	var $vT_stroke; $vT_fill : Text
	$vJ_prefs:=Form:C1466.j_prefs
	wmd_md_colors_to_sf($vJ_prefs.l_colors; ->$vL_stroke; ->$vL_fill)
	
	$vL_stroke_rgb:=wmd_md_color_to_rgb($vL_stroke)
	$vL_fill_rgb:=wmd_md_color_to_rgb($vL_fill; True:C214)
	$vL_for_stroke_rgb:=wmd_rgb_to_wb($vL_stroke_rgb)
	$vL_for_fill_rgb:=wmd_rgb_to_wb($vL_fill_rgb)
	OBJECT SET RGB COLORS:C628(*; "Form_color_sp_s"; $vL_stroke_rgb; $vL_for_stroke_rgb)
	OBJECT SET RGB COLORS:C628(*; "Form_color_sp_f"; $vL_for_fill_rgb; $vL_fill_rgb)
	
	$vT_stroke:=wmd_md_color_to_text($vL_stroke)
	$vT_fill:=wmd_md_color_to_text($vL_fill)
	Form:C1466.color_sp_s:=$vT_stroke
	Form:C1466.color_sp_f:=$vT_fill
	// *
	// *****
	
	
	