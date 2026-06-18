//%attributes = {"invisible":true,"lang":"en"}
// ----------------------------------------------------
// Nom utilisateur (OS) : Olivier GRIMBERT
// Date et heure : 15/04/16, 11:27:17
// ----------------------------------------------------
// Méthode : ogX_imgPopup_val
// Description
//
//
// Paramètres
// ----------------------------------------------------
// Entrée $1 : evenement formulaire
// $2 <PTR> : champ/var valeur num | possible sur nil !
// $3 <PTR> : bouton image
// ${4} <STR> : nom icons
// ${5} <COL> : Collection "label", "menu", "is_valid"
// ${6} <TXT> : text for idle item on last state

// $0 : vrai si Write

#DECLARE($vL_evt : Integer; $vP_field : Pointer; $vT_subPath_icon : Text; $vC_aj_menu : Collection; $vJ_app : Object)->$isOk : Boolean
var $isNilField; $isNilBtn; $isField; $isModif; $is_valid : Boolean
var $vJ_menu; $vJ_prefs : Object
var $vT_value_menu; $vT_path_icon; $vT_refMenu; $vT_menu : Text
var $vT_prefix1; $vT_app; $vT_icon; $vT_translated : Text
var $c4Fu_method : 4D:C1709.Function

$isOk:=False:C215
$isNilField:=Is nil pointer:C315($vP_field)

Case of 
	: ($vL_evt=On Load:K2:1)
		If ($isNilField)
			$vT_value_menu:=""
		Else 
			$vT_value_menu:=$vP_field->
		End if 
		
		
	: ($vL_evt=On Clicked:K2:4)
		$isField:=Not:C34(Is a variable:C294($vP_field))
		$isModif:=True:C214
		Case of 
			: ($isNilField)
				$vT_value_menu:=""
				
			: ($isNilBtn)
				$vT_value_menu:=$vP_field->
				
			Else 
				$vT_value_menu:=""
		End case 
		
		$vT_path_icon:="path:/RESOURCES/"+$vT_subPath_icon
		$vT_refMenu:=Create menu:C408
		$vJ_prefs:=wmd__storage_prefs()
		$vT_app:=$vJ_prefs.t_app
		
		// *****
		// *
		//$vT_path_info_icon:="path:/RESOURCES/icons/icn_magik_info.png"
		//APPEND MENU ITEM($vT_refMenu; $vT_title; *)
		//SET MENU ITEM ICON($vT_refMenu; -1; $vT_path_info_icon)
		//SET MENU ITEM PARAMETER($vT_refMenu; -1; "release_notes")
		//APPEND MENU ITEM($vT_refMenu; "-")
		$vT_prefix1:="woxPop."
		wox_4dPop_menu_header($vT_prefix1; $vJ_app; $vT_refMenu)
		// *
		// *****
		
		For each ($vJ_menu; $vC_aj_menu)
			$vT_menu:=$vJ_menu.t_menu
			If ($vT_menu="")
				APPEND MENU ITEM:C411($vT_refMenu; "-")
				
			Else 
				$vT_icon:=$vT_menu
				//$vT_translated:=x_get_localized(k_rsct_menu; $vT_app+"_"+$vT_menu)
				$vT_translated:=$vT_app+"_"+$vT_menu
				$is_valid:=$vJ_menu.is_valid
				$c4Fu_method:=$vJ_menu.fu_method
				If ($c4Fu_method#Null:C1517)
					$c4Fu_method.call(Null:C1517; $vT_refMenu; $vJ_menu)
				Else 
					APPEND MENU ITEM:C411($vT_refMenu; $vT_translated; *)
					SET MENU ITEM PARAMETER:C1004($vT_refMenu; -1; $vT_menu)
					SET MENU ITEM ICON:C984($vT_refMenu; -1; $vT_path_icon+$vT_menu+k_png_ext)
					If ($vT_value_menu=$vT_menu)
						SET MENU ITEM MARK:C208($vT_refMenu; -1; Char:C90(18))
					End if 
					If (Not:C34($is_valid))
						DISABLE MENU ITEM:C150($vT_refMenu; -1)
					End if 
				End if 
			End if 
		End for each 
		
		$vT_menu:=Dynamic pop up menu:C1006($vT_refMenu)
		RELEASE MENU:C978($vT_refMenu)
		$isOk:=($vT_menu#"")
		If ($isOk)
			If ($isModif)
				If (Not:C34($isNilField))
					$vP_field->:=$vT_menu
				End if 
			Else 
				$isOk:=False:C215
				wox_sounds_play_beep()
			End if 
		End if 
		
End case 

