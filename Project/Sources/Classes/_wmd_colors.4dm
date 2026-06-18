// *****
// *
// Class: _wmd_colors
// Olivier Grimbert — Protée sarl — 15/08/2024 14:17:44
//
// Description:
//
// Date       | Who | Comment
// 15/08/2024 | OG  | Updated
// *
// *****

Class extends _WIDGETS

Class constructor
	Super:C1705("j_colors")
	This:C1470.l_colors:=0
	
	
Function _widget_events()
	var $vL_event_code : Integer
	var $vJ_formEvent : Object
	var $vT_objectName : Text
	$vJ_formEvent:=FORM Event:C1606
	$vL_event_code:=$vJ_formEvent.code
	$vT_objectName:=$vJ_formEvent.objectName
	
	Case of 
		: ($vL_event_code=On Bound Variable Change:K2:52)
			This:C1470._update_all()
			
		: ($vL_event_code=On Clicked:K2:4)
			If ($vT_objectName="canvas")
				This:C1470._canvas_click()
			End if 
			
	End case 
	
	
	
	// MARK: - Manager
	
Function _update_all()
	This:C1470._resize()
	This:C1470._redraw()
	
	
	// *****
	// *
Function _resize()
	var $vL_width; $vL_height : Integer
	var $vP_canvas : Pointer
	OBJECT GET SUBFORM CONTAINER SIZE:C1148($vL_width; $vL_height)
	
	$vP_canvas:=OBJECT Get pointer:C1124(Object named:K67:5; "canvas")
	If ($vP_canvas#Null:C1517)
		OBJECT SET COORDINATES:C1248($vP_canvas->; 0; 0; $vL_width; $vL_height)
	End if 
	// *
	// *****
	
	
Function _redraw()
	var $is_bkg_circle; $is_sf; $is_stroke : Boolean
	var $vL_color_bkg; $vL_stroke; $vL_shape; $vL_colors : Integer
	var $vP_canvas : Pointer
	var $vR_coef : Real
	$vP_canvas:=OBJECT Get pointer:C1124(Object named:K67:5; "canvas")
	
	
	$vL_color_bkg:=This:C1470.l_bkg_color
	$is_bkg_circle:=This:C1470.is_bkg_circle
	$vL_stroke:=This:C1470.l_stroke
	$vL_shape:=This:C1470.l_shape
	$vR_coef:=This:C1470.r_coef
	
	$is_sf:=This:C1470.is_sf
	$is_stroke:=This:C1470.is_stroke
	$vL_colors:=This:C1470._extRead_colors()
	
	$vL_shape:=$vL_shape=0 ? $is_sf ? -1 : -3 : $vL_shape  // Auto rect(s)
	$vL_stroke:=$vL_shape<0 ? $is_sf ? 3 : 1 : $vL_stroke
	$vP_canvas->:=wmd_md_shape_get_object($vP_canvas; $vL_colors; $vL_shape; $vL_stroke)
	// *
	// *****
	
	
	// *****
	// *
Function _canvas_click()
	var $is_sf; $is_editing; $is_onMouseUp; $isToDo; $is_menu_editor; $is_inForm; $isOk; $is_stroke : Boolean
	var $vL_shape; $vL_colors; $x; $y; $vL_button; $vL_color_picker; $vL_left; $vL_top; $vL_right; $vL_bottom; $vL_width; $vL_height; $vL_svg_scale; $vL_threshold_x; $vL_threshold_y; $vL_svg_Xcenter; $vL_svg_Ycenter; $vL_item_width; $vL_item_height; $vL_item_widthS; $vL_item_heightS; $x1; $y1 : Integer
	var $vJ_prefs : Object
	var $vP_canvas : Pointer
	var $vR_coefOnOff : Real
	$is_editing:=This:C1470.is_editing
	$vL_shape:=This:C1470.l_shape
	$is_sf:=This:C1470.is_sf
	$is_onMouseUp:=True:C214
	$isToDo:=False:C215
	$vP_canvas:=OBJECT Get pointer:C1124(Object named:K67:5; "canvas")
	$vJ_prefs:=wmd__storage_prefs
	$vL_colors:=This:C1470._extRead_colors()
	
	Case of 
		: (Form event code:C388=On Clicked:K2:4)
			$isToDo:=True:C214
			
	End case 
	
	
	If ($isToDo)
		GET MOUSE:C468($x; $y; $vL_button)
		
		$vL_color_picker:=This:C1470.l_picker
		$vL_color_picker:=($vL_color_picker<0) ? $vJ_prefs.l_color_picker : $vL_color_picker
		$is_menu_editor:=(Right click:C712#($vL_color_picker=1))
		$is_inForm:=Bool:C1537(This:C1470.is_inForm)
		
		If ($is_menu_editor)
			If ($is_sf)
				$isOk:=x__menu_colors_rightClic(This:C1470; ->$vL_colors)
			Else 
				$isOk:=x__menu_color_rightClic(This:C1470; ->$vL_colors)
			End if 
			
		Else 
			If ($vL_button>0)
				If ($is_editing)
					$isOk:=False:C215
					OBJECT GET COORDINATES:C663($vP_canvas->; $vL_left; $vL_top; $vL_right; $vL_bottom)  // donne la bonne taille de la grille
					$vL_width:=$vL_right-$vL_left
					$vL_height:=$vL_bottom-$vL_top
					$vL_svg_scale:=$vJ_prefs.l_svg_scale
					$vL_width:=$vL_width*$vL_svg_scale
					$vL_height:=$vL_height*$vL_svg_scale
					
					If (mouseX>=0) & (mouseY>=0)
						If ($is_sf)
							Case of 
								: ($vL_shape=-1) | ($vL_shape=-2)
									$vL_threshold_x:=$vL_width*2/3
									$vL_threshold_y:=$vL_height*2/3
									$is_stroke:=(mouseX<$vL_threshold_x) & (mouseY<$vL_threshold_y)
									
								: ($vL_shape=-3)
									$is_stroke:=True:C214
									
								Else 
									$vR_coefOnOff:=0.8
									$is_stroke:=True:C214
									$vL_svg_Xcenter:=$vL_width/2
									$vL_svg_Ycenter:=$vL_height/2
									
									$vL_item_width:=$vL_width*$vR_coefOnOff
									$vL_item_height:=$vL_height*$vR_coefOnOff
									$vL_item_widthS:=$vL_item_width/2
									$vL_item_heightS:=$vL_item_height/2
									$x:=$vL_svg_Xcenter-($vL_item_widthS/2)
									$y:=$vL_svg_Ycenter-($vL_item_heightS/2)
									$x1:=$vL_svg_Xcenter+($vL_item_widthS/2)
									$y1:=$vL_svg_Ycenter+($vL_item_heightS/2)
									$is_stroke:=(mouseX<$x) | (mouseX>$x1) | (mouseY<$y) | (mouseY>$y1)
							End case 
						Else 
							$is_stroke:=True:C214
						End if 
						$isOk:=wmd_md_colors_edit(->$vL_colors; $is_sf)
					End if 
				Else 
					BEEP:C151
				End if 
			End if 
		End if 
		
		If ($isOk)
			This:C1470._extWrite_colors($vL_colors)
			CALL SUBFORM CONTAINER:C1086(k_OnDataChange)
			This:C1470._redraw()
		End if 
		
	End if 
	// *
	// *****
	
	
	