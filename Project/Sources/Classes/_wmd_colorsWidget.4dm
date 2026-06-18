// *****
// *
// Class: _wmd_colorsWidget
// Olivier Grimbert — Protée sarl — 15/08/2024 14:17:51
//
// Description:
//
// Date       | Who | Comment
// 15/08/2024 | OG  | Updated
// *
// *****

Class extends _WIDGETS

Class constructor
	Super:C1705("j_colorsWidget")
	This:C1470.l_colors:=0
	This:C1470._init()
	
	
	
Function _widget_events()
	var $vL_event_code : Integer
	var $vJ_formEvent : Object
	var $vT_objectName; $vT_LB : Text
	$vJ_formEvent:=FORM Event:C1606
	$vL_event_code:=$vJ_formEvent.code
	$vT_objectName:=$vJ_formEvent.objectName
	
	$vT_LB:="LB_svgColours"
	Case of 
		: ($vT_objectName="canvas")
			This:C1470._canvas_events($vT_objectName)
			
		: ($vL_event_code=On Bound Variable Change:K2:52)
			This:C1470._update_all()
			
		: ($vL_event_code=On Clicked:K2:4)
			Case of 
				: ($vT_objectName="bt_sf")
					This:C1470._bt_sf()
					
				: ($vT_objectName="bt_menu")
					This:C1470._bt_menu()
					
				: ($vT_objectName="o_RGBsample")
					This:C1470._rgb_sample()
			End case 
			
			
	End case 
	
	
	
	// MARK: - Manager
	
Function _update_all()
	This:C1470._resize()
	This:C1470._redraw()
	
	
Function _init()
	
	
	// *****
	// *
Function _resize()
	var $is_sf; $is_dark : Boolean
	var $vL_width; $vL_height; $vL_gap; $vL_xl; $vL_yt; $vL_xr; $vL_yb; $vL_wh; $x1; $x2; $y1; $y2; $y3; $y4; $vL_color : Integer
	var $vP_RGBsample; $vP_canvas; $vP_bt_menu; $vP_bt_sf : Pointer
	var $vT_object_name; $vT_shortcut_sf : Text
	OBJECT GET SUBFORM CONTAINER SIZE:C1148($vL_width; $vL_height)
	
	$is_sf:=This:C1470.is_sf
	$is_dark:=This:C1470.is_dark
	
	$vP_RGBsample:=OBJECT Get pointer:C1124(Object named:K67:5; "o_RGBsample")
	$vP_canvas:=OBJECT Get pointer:C1124(Object named:K67:5; "canvas")
	
	$vP_bt_menu:=OBJECT Get pointer:C1124(Object named:K67:5; "bt_menu")
	$vP_bt_sf:=OBJECT Get pointer:C1124(Object named:K67:5; "bt_sf")
	//OBJECT SET VISIBLE($vP_bt_menu->; False)
	//OBJECT SET VISIBLE($vP_bt_sf->; False)
	
	$vL_gap:=4
	$vL_xl:=$vL_gap
	$vL_yt:=$vL_gap
	$vL_xr:=$vL_width-$vL_gap
	$vL_yb:=$vL_height-$vL_gap
	
	//OBJECT GET COORDINATES($vP_bt_menu->; $vL_left; $vL_top; $vL_right; $vL_bottom)
	//$vL_wh:=$vL_right-$vL_left
	$vL_wh:=24
	$x1:=$vL_xl
	$x2:=$x1+$vL_wh
	$y1:=$vL_yt
	$y2:=$vL_yt+$vL_wh
	OBJECT SET COORDINATES:C1248($vP_bt_menu->; $x1; $y1; $x2; $y2)
	$y3:=$y2+2
	$y4:=$y3+$vL_wh
	OBJECT SET VISIBLE:C603($vP_bt_sf->; $is_sf)
	If ($is_sf)
		OBJECT SET COORDINATES:C1248($vP_bt_sf->; $x1; $y3; $x2; $y4)
	End if 
	$x2+=3
	
	//$x2:=$vL_xl
	//$y1:=$vL_yt
	//$y4:=$y1+40
	OBJECT SET COORDINATES:C1248($vP_RGBsample->; $x2; $y1; $vL_xr; $y4)
	
	$y4+=$vL_gap
	OBJECT SET COORDINATES:C1248($vP_canvas->; $vL_xl; $y4; $vL_xr; $vL_yb)
	
	$vT_object_name:="bkg"
	OBJECT SET COORDINATES:C1248(*; $vT_object_name; $vL_xl-1; $y4-1; $vL_xr; $vL_yb)
	$vL_color:=$is_dark ? 0x001E1E1E : 0x00FFFFFF
	OBJECT SET RGB COLORS:C628(*; $vT_object_name; $vL_color; $vL_color)
	
	$vT_shortcut_sf:=This:C1470.t_shortcut_sf
	If ($vT_shortcut_sf#"")
		OBJECT SET SHORTCUT:C1185($vP_bt_sf->; $vT_shortcut_sf)
	Else 
		OBJECT SET SHORTCUT:C1185($vP_bt_sf->; "E"; Command key mask:K16:1)
	End if 
	// *
	// *****
	
	
Function _redraw()
	var $is_sf; $is_stroke : Boolean
	var $vL_colors : Integer
	var $vP_btn; $vP_RGBsample; $vP_canvas : Pointer
	$vP_btn:=OBJECT Get pointer:C1124(Object named:K67:5; "bt_sf")
	If (Form:C1466.is_sf)
		x_btn_toggleSet($vP_btn; Num:C11(This:C1470.is_stroke))
	End if 
	$vL_colors:=This:C1470._extRead_colors()
	$is_sf:=This:C1470.is_sf
	$is_stroke:=This:C1470.is_stroke
	$vP_RGBsample:=OBJECT Get pointer:C1124(Object named:K67:5; "o_RGBsample")
	w_svg_RGBsample($vP_RGBsample; $vL_colors; $is_sf; $is_stroke)
	$vP_canvas:=OBJECT Get pointer:C1124(Object named:K67:5; "canvas")
	w_svg_colorsGrig($vP_canvas; $vL_colors; $is_sf; $is_stroke; This:C1470.l_shape)
	// *
	// *****
	
	
Function _bt_sf()
	If (Form:C1466.is_sf)
		Form:C1466.is_stroke:=Not:C34(Form:C1466.is_stroke)
		This:C1470._redraw()  // -On Clicked
	End if 
	
Function _rgb_sample()
	If (Right click:C712)
		This:C1470._bt_menu()
	Else 
		If (Form:C1466.is_sf)
			Form:C1466.is_stroke:=Not:C34(Form:C1466.is_stroke)
			This:C1470._redraw()  // -On Clicked
		End if 
	End if 
	
	
Function _bt_menu()
	var $is_editing; $is_sf; $isOk : Boolean
	var $vL_colors : Integer
	$is_editing:=This:C1470.is_editing
	$vL_colors:=This:C1470._extRead_colors()
	
	$is_sf:=This:C1470.is_sf
	If ($is_sf)
		$isOk:=x__menu_colors_rightClic(This:C1470; ->$vL_colors)
	Else 
		$isOk:=x__menu_color_rightClic(This:C1470; ->$vL_colors)
	End if 
	If ($isOk)
		This:C1470._extWrite_colors($vL_colors)
		CALL SUBFORM CONTAINER:C1086(k_OnDataChange)
		This:C1470._redraw()
	End if 
	
	
	
Function _canvas_events($vT_canvas : Text)
	var $isAccept; $is_onMouseUp; $is_clicked; $isToDo; $is_inForm; $isEditable; $isOk; $is_sf; $is_stroke : Boolean
	var $vL_event; $idx_color; $x; $y; $vL_button; $vL_colors; $vL_stroke; $vL_fill : Integer
	var $vJ_space_md : Object
	var $vP_canvas : Pointer
	var $txt : Text
	$vP_canvas:=OBJECT Get pointer:C1124(Object named:K67:5; $vT_canvas)
	
	$isAccept:=False:C215
	$is_onMouseUp:=False:C215
	$is_clicked:=False:C215
	
	$vL_event:=k_OnDataChange
	
	
	Case of 
		: (Form event code:C388=On Clicked:K2:4)
			$isToDo:=True:C214
			$is_clicked:=True:C214
			This:C1470.is_clicked:=True:C214
			
		: (Form event code:C388=On Double Clicked:K2:5)
			$isToDo:=True:C214
			$isAccept:=True:C214
			$vL_event:=k_OnDoubleClicked
			
		: (Form event code:C388=On Mouse Up:K2:58)
			//If ($is_onMouseUp) && (Not($is_inForm))
			If ($is_onMouseUp)
				CALL SUBFORM CONTAINER:C1086($vL_event)
			End if 
			
		: (Form event code:C388=On Mouse Move:K2:35)
			$idx_color:=This:C1470._svg_get_tile($vP_canvas; True:C214)
			If ($idx_color>=0)
				$txt:=x_get_color_infos($idx_color; $vJ_space_md)
				OBJECT SET HELP TIP:C1181($vP_canvas->; $txt)
			End if 
			
	End case 
	
	If ($isToDo)
		$isEditable:=This:C1470.is_editing
		If ($isEditable)
			$isToDo:=False:C215
			$is_onMouseUp:=This:C1470.is_onMouseUp
			$is_inForm:=Bool:C1537(This:C1470.is_inForm)
			
			MOUSE POSITION:C468($x; $y; $vL_button)
			If ($vL_button=1) || ($isAccept)
				$vL_colors:=This:C1470._extRead_colors()
				$idx_color:=This:C1470._svg_get_tile($vP_canvas)
				$isOk:=($idx_color>=0)
				If ($isOk)
					$is_sf:=This:C1470.is_sf
					If ($is_sf)
						$is_stroke:=This:C1470.is_stroke
						wmd_md_colors_to_sf($vL_colors; ->$vL_stroke; ->$vL_fill)
						If ($is_stroke)
							$vL_colors:=wmd_md_colors_from_sf($idx_color; $vL_fill)
						Else 
							$vL_colors:=wmd_md_colors_from_sf($vL_stroke; $idx_color)
						End if 
						
					Else 
						$vL_colors:=$idx_color
					End if 
					
					This:C1470._extWrite_colors($vL_colors)
					//If (Not($is_onMouseUp || $is_inForm)) || ($isAccept)
					If (Not:C34($is_onMouseUp)) || ($isAccept)
						CALL SUBFORM CONTAINER:C1086($vL_event)
					End if 
					This:C1470._redraw()
					
				End if 
			End if 
		End if 
	End if 
	
	
Function _svg_get_tile($vP_canvas : Pointer; $is_over : Boolean)->$idx_color : Integer
	$idx_color:=-1
	var $vL_bottom; $vL_left; $vL_right; $vL_round; $vL_round_x; $vL_round_y; $vL_tile_no; $vL_top : Integer
	var $vT_idSvg : Text
	$vT_idSvg:=SVG Find element ID by coordinates:C1054($vP_canvas->; mouseX; mouseY)  // ID de l'élément svg survolé
	$isOk:=True:C214
	Case of 
		: ($vT_idSvg="root")
			$vL_tile_no:=k_MDcolorWhite
			
		: ($vT_idSvg="c_none")
			$vL_tile_no:=k_MDcolorTransparent
			
		: ($vT_idSvg="c_@")
			If ($is_over)
				var $vT_idSvg_last : Text
				$vT_idSvg_last:=This:C1470.t_idSvg_last
				If ($vT_idSvg_last#$vT_idSvg)
					OBJECT GET COORDINATES:C663($vP_canvas->; $vL_left; $vL_top; $vL_right; $vL_bottom)
					$vL_round_x:=($vL_right-$vL_left)/50
					$vL_round_y:=($vL_bottom-$vL_top)/50
					$vL_round:=wox_min($vL_round_x; $vL_round_y)
					SVG SET ATTRIBUTE:C1055($vP_canvas->; $vT_idSvg_last; "rx"; 0; "ry"; 0; *)
					SVG SET ATTRIBUTE:C1055($vP_canvas->; $vT_idSvg; "rx"; $vL_round; "ry"; $vL_round; *)
					This:C1470.t_idSvg_last:=$vT_idSvg
				End if 
			End if 
			$vL_tile_no:=Num:C11($vT_idSvg)
			
		Else 
			$isOk:=False:C215
	End case 
	
	var $vJ_space_md : Object
	$vJ_space_md:=wmd__storage_space_md
	If ($isOk)
		var $tt : Integer
		var $vC_al_colorRGB : Collection
		var $isOk : Boolean
		$vC_al_colorRGB:=$vJ_space_md.colorRGB
		$tt:=$vC_al_colorRGB.length
		$idx_color:=wox_max(0; wox_min($tt; $vL_tile_no))  // qui nous donne son indice dans les tableaux des éléments affichés
	End if 
	// *
	// *****
	
	