<?php

if(isset($type_addition)&&strlen($type_addition)>1){
	$incl="news.".$type_addition.".inc.tpl";
	@include $incl;
}
else{include "news.default.inc.tpl";}
