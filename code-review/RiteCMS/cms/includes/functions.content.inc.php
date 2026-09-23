<?php

function qrpage($size="210x210")
{
//to be called within template
$output='<a href="'.BASE_URL.PAGE.'.m"><img src="https://chart.apis.google.com/chart?chs='.$size.'&amp;cht=qr&amp;chld=%7C0&amp;chl='.BASE_URL.PAGE.'.m" alt="Mobile Version" /></a>';
return $output;
}

function myqr($content="zoriamedia",$size="210x210")
{
// mecard format MECARD:N:Owen,Sean;ADR:76 9th Avenue,New York, NY 10011;TEL:+12125551212;EMAIL:srowen@cool.com;; 
return '<img src="https://chart.apis.google.com/chart?chf=a,s,000000&amp;chs='.
	$size.'&amp;cht=qr&amp;chld=|0&amp;chl='.$content.'" />';
}

function slideshow($images)
	{
	$images= explode("||", $images);
	$slideshow='<div id="slideshow">';
	$slideshow.="\r";
	for ($i = 0; $i < count($images); $i++) {
		$image=explode("::",$images[$i]);
		$image[0]=str_replace('"', '', $image[0]);
		$slideshow.='<div class="mySlides"><img src="'.$image[1].'"><div class="text">'.$image[0].'</div></div>'."\r";
	}
	$slideshow.='<a class="prev" onclick="plusSlides(-1)">&#10094;</a>'."\r".'<a class="next" onclick="plusSlides(1)">&#10095;</a>'."\r</div>\r";
	$slideshow.='<div id="slideshow_dots">'."\r";
	for ($i = 0; $i < count($images); $i++) {
	$ci=$i+1;
	$slideshow.='<span class="dot" onclick="currentSlide('.$ci.')"></span>'."\r"; 
	}
	$slideshow.="</div>\r";
	return($slideshow);
}


?>
