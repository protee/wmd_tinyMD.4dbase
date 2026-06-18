//%attributes = {"invisible":true,"lang":"en"}
// *****
// *
// Method: _wod_FORM_EDIT
// Olivier Grimbert — Protée sarl — 16/08/2024 22:52:15
//
// Description: 
//
// Date       | Who | Comment
// 28/12/2022 | OG | Initial version Protée sarl
// 16/08/2024 | OG  | Updated
// *
// *****

#DECLARE($vL_noTable : Integer; $vT_form : Text)

If ($vL_noTable=0)
	FORM EDIT:C1749($vT_form)
Else 
	FORM EDIT:C1749(Table:C252($vL_noTable)->; $vT_form)
End if 


