//%attributes = {"invisible":true,"lang":"en"}

#DECLARE($vJ_widget : Object; $vP_color : Pointer)->$isOk : Boolean
var $is_editable; $is_menu_colors : Boolean
var $vC_at_menu_main; $vC_at_menu_sub : Collection
var $vL_color; $vL_idi; $vL_offset; $vL_idj; $idx; $vL_rgb; $vL_rgb_new; $vL_r; $vL_g; $vL_b : Integer
var $vJ_prefs : Object
var $vT_path_menu_icons; $vT_refMenu; $vT_label_main; $vT_subRef; $vT_label_sub; $vT_answerMenu; $vT_stroke_color; $vT_menu_param; $txt : Text

$is_editable:=$vJ_widget.is_editing

$vJ_prefs:=wmd__storage_prefs

$vL_color:=$vP_color->

$vC_at_menu_main:=New collection:C1472
$vC_at_menu_main.push(Get localized string:C991("SubColorCopy"))  //"Copy color...")  // sub
If ($is_editable)
	$vC_at_menu_main.push(Get localized string:C991("SubColorB"))  //"Black")
	$vC_at_menu_main.push(Get localized string:C991("SubColorG"))  //"Grey")
	$vC_at_menu_main.push(Get localized string:C991("SubColorW"))  //"White")
	$vC_at_menu_main.push(Get localized string:C991("SubColorRandom"))  //"rgb picker")
	$vC_at_menu_main.push(Get localized string:C991("rgbPicker"))  //"Random")
End if 

$vT_path_menu_icons:="path:/RESOURCES/icons/icn_tools_color"

$vT_refMenu:=Create menu:C408
wmd_md_color_hmenu_create($vL_color; "stroke"; "Stroke"; $vT_refMenu)
APPEND MENU ITEM:C411($vT_refMenu; "-")

$vL_idi:=1
For each ($vT_label_main; $vC_at_menu_main)
	Case of 
		: ($vL_idi=1)
			$vL_offset:=$vL_idi*100
			$vC_at_menu_sub:=New collection:C1472()
			$vC_at_menu_sub.push("MD palette"; "integer"; "rgb (r, g, b)"; "#rgb"; "#rrggbb"; "rgb(r%, g%, b%)")
			$vT_subRef:=Create menu:C408
			$vL_idj:=1
			For each ($vT_label_sub; $vC_at_menu_sub)
				APPEND MENU ITEM:C411($vT_subRef; $vT_label_sub; *)
				SET MENU ITEM PARAMETER:C1004($vT_subRef; -1; String:C10($vL_idj+$vL_offset-1))
				$vL_idj+=1
			End for each 
			APPEND MENU ITEM:C411($vT_refMenu; $vT_label_main; $vT_subRef; *)
			RELEASE MENU:C978($vT_subRef)
			
		Else 
			APPEND MENU ITEM:C411($vT_refMenu; $vT_label_main; *)
	End case 
	SET MENU ITEM PARAMETER:C1004($vT_refMenu; -1; String:C10($vL_idi))
	SET MENU ITEM ICON:C984($vT_refMenu; -1; $vT_path_menu_icons+String:C10($vL_idi-1)+k_png_ext)
	$vL_idi+=1
End for each 

$vT_answerMenu:=Dynamic pop up menu:C1006($vT_refMenu)
RELEASE MENU:C978($vT_refMenu)
$isOk:=($vT_answerMenu#"")
If ($isOk)
	$vT_stroke_color:="stroke-color-"
	$is_menu_colors:=True:C214
	Case of 
		: ($vT_answerMenu=($vT_stroke_color+"@"))
			$vT_menu_param:=Replace string:C233($vT_answerMenu; $vT_stroke_color; ""; 1)
			
		Else 
			$is_menu_colors:=False:C215
			
			$idx:=Num:C11($vT_answerMenu)
			Case of 
				: ($idx>=100) & ($idx<200)
					$idx:=$idx%100
					Case of 
						: ($idx=0)
							$txt:=String:C10($vL_color)
							
						: ($idx=1)
							$txt:=String:C10($vL_color; "&x")
							
						Else 
							$idx:=$idx-2
							$txt:=wmd_rgb_to_svg(wmd_md_color_to_rgb($vL_color); $idx)
					End case 
					SET TEXT TO PASTEBOARD:C523($txt)
					$isOk:=False:C215
					
				: ($idx=2)
					$vL_color:=k_MDcolorBlack
					
				: ($idx=3)
					$vL_color:=k_MDcolorGrey
					
				: ($idx=4)
					$vL_color:=k_MDcolorWhite
					
				: ($idx=5)
					$vL_color:=wmd_md_color_random
					
				: ($idx=6)
					$vL_rgb:=wmd_md_color_to_rgb($vL_color)
					$vL_rgb_new:=Select RGB color:C956($vL_rgb)
					If ($vL_rgb_new#$vL_rgb)
						wmd_rgb_to_r_g_b($vL_rgb_new; ->$vL_r; ->$vL_g; ->$vL_b)
						$vL_color:=wmd_md_color_from_r_g_b($vL_r; $vL_g; $vL_b)
					End if 
			End case 
			
	End case 
	
	If ($isOk)
		If ($is_menu_colors)
			$isOk:=$is_editable
			If ($is_editable)
				Case of 
					: ($vT_menu_param="none")
						$vL_color:=k_MDcolorTransparent
						
					: ($vT_menu_param="picker")
						$vL_rgb:=wmd_md_color_to_rgb($vL_color)
						$vL_color:=wmd_md_color_from_rgb(Select RGB color:C956($vL_rgb))
					Else 
						$vL_color:=Num:C11($vT_menu_param)
				End case 
			End if 
		End if 
		$vP_color->:=$vL_color
	End if 
	
End if 

