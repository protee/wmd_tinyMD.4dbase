//%attributes = {"invisible":true,"lang":"en"}
// *****
// *
// Method: app_init_widgets
// Olivier Grimbert — Protée sarl — 16/08/2024 22:53:12
//
// Description: 
//
// Date       | Who | Comment
// 16/08/2024 | OG  | Updated
// *
// *****

var $vJ_widgets : Object
$vJ_widgets:=New shared object:C1526
Use (Storage:C1525)
	Storage:C1525.j_widgets:=$vJ_widgets
End use 
Use ($vJ_widgets)
	var $vJ_widget : Object
	
	
	// ***** colors_widget
	// *
	$vJ_widget:=New shared object:C1526
	$vJ_widgets.j_colorsWidget:=$vJ_widget
	
	$vJ_widget.l_border:=Border None:K42:27
	$vJ_widget.l_bkg_color:=k_MDcolorWhite
	$vJ_widget.l_shape:=1  // rect
	
	$vJ_widget.t_font_face:=""  // NC !
	$vJ_widget.is_sf:=True:C214
	$vJ_widget.is_stroke:=True:C214
	$vJ_widget.t_shortcut_sf:=" "
	
	$vJ_widget.is_editing:=True:C214
	$vJ_widget.is_onMouseUp:=False:C215
	// *
	// *****
	
	// ***** colors
	// *
	$vJ_widget:=New shared object:C1526
	$vJ_widgets.j_colors:=$vJ_widget
	
	$vJ_widget.l_border:=Border None:K42:27
	$vJ_widget.l_bkg_color:=k_MDcolorTransparent
	$vJ_widget.is_bkg_circle:=False:C215
	$vJ_widget.l_stroke:=3
	$vJ_widget.l_shape:=0  // Auto rect(s)
	$vJ_widget.r_coef:=0.8
	$vJ_widget.is_tr:=False:C215
	
	$vJ_widget.t_font_face:="Calibri"
	$vJ_widget.l_font_style:=1
	$vJ_widget.l_font_size:=12
	$vJ_widget.t_text:="Text!"
	$vJ_widget.is_sf:=True:C214
	$vJ_widget.is_stroke:=True:C214
	$vJ_widget.l_picker:=-1  // Use global 0 Form, 1 menu
	
	$vJ_widget.l_window_type:=Plain form window:K39:10
	$vJ_widget.is_editing:=True:C214
	// *
	// *****
	
	
End use 


