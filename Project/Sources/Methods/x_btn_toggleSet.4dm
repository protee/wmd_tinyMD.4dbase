//%attributes = {"invisible":true,"lang":"en"}
// ----------------------------------------------------
// Nom utilisateur (OS) : Olivier GRIMBERT
// Date et heure : 05/04/16, 15:48:59
// ----------------------------------------------------
// Méthode : ogX_btn_toogleSet
// Description
// 
//
// Paramètres
// $1 <PTR> : sur bouton image
// $2 <INT> : valeur du toogle
// ----------------------------------------------------

#DECLARE($vP_button : Pointer; $vL_value : Integer)

var $vT_btnFormat : Text
var $k; $k1 : Integer
If ($vP_button=Null:C1517)
	TRACE:C157
	
Else 
	$vT_value:=$vL_value>=0 ? String:C10($vL_value) : ""
	
	$vT_btnFormat:=OBJECT Get format:C894($vP_button->)
	$k:=Position:C15(k_png_ext; $vT_btnFormat)
	//OBJECT SET FORMAT($PtrButton->;Substring($btnFormat;1;$k-2)+String($Value)+Substring($btnFormat;$k))
	
	var $vT_char; $vT_value : Text
	$k1:=$k-1
	$vT_char:=Substring:C12($vT_btnFormat; $k1; 1)
	While (($vT_char>="0") & ($vT_char<="9"))  // Check if 0-9 digit
		$k1+=-1
		$vT_char:=Substring:C12($vT_btnFormat; $k1; 1)
	End while 
	OBJECT SET FORMAT:C236($vP_button->; Substring:C12($vT_btnFormat; 1; $k1)+$vT_value+Substring:C12($vT_btnFormat; $k))
End if 

