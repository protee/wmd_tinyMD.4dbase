//%attributes = {"shared":false,"lang":"en","invisible":true}
// ----------------------------------------------------
// Nom utilisateur (OS) : Olivier Grimbert
// Date et heure : 15/07/16, 14:54:18
// ----------------------------------------------------
// Méthode : x_form_xyResize
// Description
//
//
// Paramètres
// $1, $2 <PTR> : X et Y
// $3, $4 <INT> : largeur, hauteur fenêtre
// ----------------------------------------------------

#DECLARE($vL_width : Integer; $vL_height : Integer; $vP_x : Pointer; $vP_y : Pointer)


$vP_x->:=wox_min(Screen width:C187; $vP_x->+$vL_width)-$vL_width
$vP_y->:=wox_min(Screen height:C188; $vP_y->+$vL_height)-$vL_height

$vP_y->:=wox_max($vP_y->; wmd__storage_prefs.l_top+16)




