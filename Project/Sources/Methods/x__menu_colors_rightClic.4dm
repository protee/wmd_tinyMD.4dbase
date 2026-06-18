//%attributes = {"invisible":true,"lang":"en"}


#DECLARE($vJ_widget : Object; $vP_colors : Pointer)->$isOk : Boolean
var $is_editable; $is_menu_colors; $is_strokeFill : Boolean
var $vC_at_menu_main; $vC_at_menu_sub : Collection
var $vL_color_stroke; $vL_color_fill; $vL_idi; $vL_idj; $vL_offset; $tt1; $idx_color; $idx; $vL_mano; $vL_rgb; $vL_rgb_new; $vL_r; $vL_g; $vL_b; $vL_color; $vL_colors : Integer
var $vJ_prefs : Object
var $vT_path_menu_icons; $vT_refMenu; $vT_label_main; $vT_subRef; $vT_label_sub; $vT_colorName; $vT_answerMenu; $vT_stroke_color; $vT_fill_color; $vT_menu_param; $txt : Text

$is_editable:=$vJ_widget.is_editing

$vJ_prefs:=wmd__storage_prefs

$vL_colors:=$vP_colors->
wmd_md_colors_to_sf($vL_colors; ->$vL_color_stroke; ->$vL_color_fill)


$vC_at_menu_main:=New collection:C1472
$vC_at_menu_main.push(Get localized string:C991("SubColorsCopy"))  //"Copy colors...")  // sub
If ($is_editable)
	$vC_at_menu_main.push(Get localized string:C991("SubColors"))  //"Colors...")  // sub
	$vC_at_menu_main.push(Get localized string:C991("SubColorsInv"))  //"Colors inverse...")  // sub
	$vC_at_menu_main.push(Get localized string:C991("SubColorsBW"))  //"Black & White")
	$vC_at_menu_main.push(Get localized string:C991("SubColorsGW"))  //"Grey & White")
	$vC_at_menu_main.push(Get localized string:C991("SubColorsWB"))  //"White & Black")
	$vC_at_menu_main.push(Get localized string:C991("SubColorsRandom"))  //"Random")
	$vC_at_menu_main.push(Get localized string:C991("SubColorsRandomInv"))  //"Random inverse")
	
	$vC_at_menu_main.push(Get localized string:C991("SubColorsStroke"))  //"All Stroke")
	$vC_at_menu_main.push(Get localized string:C991("SubColorsFill"))  //"All Fill")
	$vC_at_menu_main.push(Get localized string:C991("SubColorsExchange"))  //"Exchange")
	
	$vC_at_menu_main.push(Get localized string:C991("rgbPickerStroke"))  //"Random")
	$vC_at_menu_main.push(Get localized string:C991("rgbPickerFill"))  //"Random")
End if 

$vT_path_menu_icons:="path:/RESOURCES/icons/icn_tools_colors"

$vT_refMenu:=Create menu:C408
wmd_md_color_hmenu_create($vL_color_stroke; "stroke"; "Stroke"; $vT_refMenu)
wmd_md_color_hmenu_create($vL_color_fill; "fill"; "Fill"; $vT_refMenu)
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
			
			
		: ($vL_idi>=2) && ($vL_idi<=3)
			$vL_offset:=$vL_idi*100
			
			// SUB COLOR MENU
			$vT_subRef:=Create menu:C408
			//var $vT_path_menu_icons_colors : Text
			//$vT_path_menu_icons_colors:="colors/icnm_md_"  // in ogColors
			
			$tt1:=18
			For ($vL_idj; 0; $tt1)
				$idx_color:=wmd_md_color_from_popup($vL_idj*14)+5
				$vT_colorName:=x_get_color_infos($idx_color)
				APPEND MENU ITEM:C411($vT_subRef; $vT_colorName; *)
				SET MENU ITEM PARAMETER:C1004($vT_subRef; -1; String:C10($vL_idj+$vL_offset))
				wmd_SET_MENU_ITEM_icnm($vT_subRef; -1; $idx_color; True:C214)
				
			End for 
			
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

$isOk:=(""#$vT_answerMenu)
If ($isOk)
	$vT_stroke_color:="stroke-color-"
	$vT_fill_color:="fill-color-"
	$is_menu_colors:=True:C214
	Case of 
		: ($vT_answerMenu=($vT_stroke_color+"@"))
			$vT_menu_param:=Replace string:C233($vT_answerMenu; $vT_stroke_color; ""; 1)
			$is_strokeFill:=True:C214
			
		: ($vT_answerMenu=($vT_fill_color+"@"))
			$vT_menu_param:=Replace string:C233($vT_answerMenu; $vT_fill_color; ""; 1)
			$is_strokeFill:=False:C215
			
		Else 
			$is_menu_colors:=False:C215
			$idx:=Num:C11($vT_answerMenu)
			
			Case of 
				: ($idx>=100) & ($idx<200)
					$idx:=$idx%100
					Case of 
						: ($idx=0)
							$txt:="wmd_md_colors_from_sf("+String:C10($vL_color_stroke)+";"+String:C10($vL_color_fill)+")"
							
						: ($idx=1)
							$txt:=String:C10($vL_colors; "&x")
							
						Else 
							$idx:=$idx-2
							$txt:=wmd_rgb_to_svg(wmd_md_color_to_rgb($vL_color_stroke); $idx)+", "+wmd_rgb_to_svg(wmd_md_color_to_rgb($vL_color_fill); $idx)
					End case 
					SET TEXT TO PASTEBOARD:C523($txt)
					$isOk:=False:C215
					
					
				: ($idx>=200) & ($idx<300)
					$idx:=$idx%100
					wmd_md_colors_to_sf(wmd_md_colors_from_row($idx; 9; 0; 1); ->$vL_color_stroke; ->$vL_color_fill)
					
					
				: ($idx>=300) & ($idx<400)
					$idx:=$idx%100
					wmd_md_colors_to_sf(wmd_md_colors_from_row($idx; 0; 9; 1); ->$vL_color_stroke; ->$vL_color_fill)
					
					
				: ($idx=4)
					$vL_color_stroke:=k_MDcolorBlack
					$vL_color_fill:=k_MDcolorWhite
					
				: ($idx=5)
					$vL_color_stroke:=k_MDcolorGrey
					$vL_color_fill:=k_MDcolorWhite
					
				: ($idx=6)
					$vL_color_stroke:=k_MDcolorWhite
					$vL_color_fill:=k_MDcolorBlack
					
				: ($idx=7)
					wmd_md_colors_to_sf(wmd_md_colors_random; ->$vL_color_stroke; ->$vL_color_fill)
					
				: ($idx=8)
					wmd_md_colors_to_sf(wmd_md_colors_random; ->$vL_color_fill; ->$vL_color_stroke)
					
				: ($idx=9)
					$vL_color_fill:=$vL_color_stroke
					
				: ($idx=10)
					$vL_color_stroke:=$vL_color_fill
					
				: ($idx=11)
					$vL_mano:=$vL_color_stroke
					$vL_color_stroke:=$vL_color_fill
					$vL_color_fill:=$vL_mano
					
				: ($idx=12)
					$vL_rgb:=wmd_md_color_to_rgb($vL_color_stroke)
					$vL_rgb_new:=Select RGB color:C956($vL_rgb)
					If ($vL_rgb_new#$vL_rgb)
						wmd_rgb_to_r_g_b($vL_rgb_new; ->$vL_r; ->$vL_g; ->$vL_b)
						$vL_color_stroke:=wmd_md_color_from_r_g_b($vL_r; $vL_g; $vL_b)
					End if 
					
				: ($idx=13)
					$vL_rgb:=wmd_md_color_to_rgb($vL_color_fill)
					$vL_rgb_new:=Select RGB color:C956($vL_rgb)
					If ($vL_rgb_new#$vL_rgb)
						wmd_rgb_to_r_g_b($vL_rgb_new; ->$vL_r; ->$vL_g; ->$vL_b)
						$vL_color_fill:=wmd_md_color_from_r_g_b($vL_r; $vL_g; $vL_b)
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
				
				If ($is_strokeFill)
					$vL_colors:=wmd_md_colors_from_sf($vL_color; $vL_color_fill)
				Else 
					$vL_colors:=wmd_md_colors_from_sf($vL_color_stroke; $vL_color)
				End if 
			Else 
				BEEP:C151
			End if 
		Else 
			$vL_colors:=wmd_md_colors_from_sf($vL_color_stroke; $vL_color_fill)
		End if 
		$vP_colors->:=$vL_colors
	End if 
End if 

