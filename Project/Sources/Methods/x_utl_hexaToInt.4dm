//%attributes = {"invisible":true,"lang":"en"}

var $vT_hexTxt : Text
$vT_hexTxt:=$1

var $vL_pos; $vL_len; $i; $vL_dec : Integer
$vL_len:=Length:C16($vT_hexTxt)
var $vT_hexBase : Text
$vT_hexBase:="123456789ABCDEF"
$vL_dec:=0
//For ($i;$len;1;-1)
For ($i; 1; $vL_len)
	$vL_dec:=$vL_dec << 4
	$vL_pos:=Position:C15($vT_hexTxt[[$i]]; $vT_hexBase)
	//$dec:=$dec+($pos*(16^($len-$i)))
	$vL_dec:=$vL_dec+$vL_pos
End for 
$0:=$vL_dec


