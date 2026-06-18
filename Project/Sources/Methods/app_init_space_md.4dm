//%attributes = {"invisible":true,"lang":"en"}
// *****
// *
// Method: app_init_space_md
// Olivier Grimbert — Protée sarl — 16/08/2024 22:52:51
//
// Description: 
//
// Date       | Who | Comment
// 16/08/2024 | OG  | Updated
// *
// *****

var $vJ_space_md : Object
$vJ_space_md:=x_datas_json_load("space_md")
Use (Storage:C1525)
	Storage:C1525.j_space_md:=OB Copy:C1225($vJ_space_md; ck shared:K85:29)
End use 


//__compiler_init_color

