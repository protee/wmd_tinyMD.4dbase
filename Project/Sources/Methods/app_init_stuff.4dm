//%attributes = {"invisible":true,"lang":"en"}
// *****
// *
// Method: app_init_stuff
// Olivier Grimbert — Protée sarl — 16/08/2024 22:52:51
//
// Description: 
//
// Date       | Who | Comment
// 16/08/2024 | OG  | Updated
// *
// *****

var $vJ_stuff : Object
$vJ_stuff:=New shared object:C1526
Use (Storage:C1525)
	Storage:C1525.j_stuff:=$vJ_stuff
End use 

Use ($vJ_stuff)
	// ***** Splash cache
	// *
	$vJ_stuff.is_init:=False:C215
	$vJ_stuff.l_tick_end:=Tickcount:C458  // Used if is_end_all
	// *
	// *****
	
	$vJ_stuff.fo_colors:=Folder:C1567(fk resources folder:K87:11).folder("colors")
	
	
End use 



