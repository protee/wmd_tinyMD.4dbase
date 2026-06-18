//%attributes = {"lang":"en"}

var $vL_WinRef : Integer
var $vJ_form : Object
var $vT_form : Text
wmd_initRegister()

$vT_form:="_test"
$vL_WinRef:=Open form window:C675($vT_form; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
DIALOG:C40($vT_form; $vJ_form)
CLOSE WINDOW:C154($vL_WinRef)

