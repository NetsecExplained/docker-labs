<?php

if(isset($type_addition)&&strlen($type_addition)>1){
	$incl="overview.".$type_addition.".inc.tpl";
	@include $incl;
}
else{include "overview.default.inc.tpl";}