function hide_comment_form()
 {
  document.getElementById('commentform').style.display='none';
  document.getElementById('show_commentform').style.display='block';
 }

function show_comment_form()
 {
  document.getElementById('commentform').style.display='block';
  document.getElementById('show_commentform').style.display='none';
  location.hash='commentform';
  document.getElementById('comment_text').focus();
 }

function show_comments()
 {
  document.getElementById('commentcontainer').style.display='block';
  document.getElementById('commentlink').style.display='none';
  location.hash='comments';
 }

function plusSlides(n) {
  clearTimeout(timer);
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  clearTimeout(timer);
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}

function autoSlides() {
  if(typeof(loopcount) === 'undefined') { loopcount = 2; }
  if(typeof(tc) === 'undefined') { tc = 1; }
  if(typeof(ti) === 'undefined') { ti = 3000; }
  if(typeof slideIndex === 'undefined') { slideIndex = 1; }
  let slides = document.getElementsByClassName("mySlides");
  let loopcounts=loopcount * slides.length;
  let dots = document.getElementsByClassName("dot");
for (i = 0; i < slides.length; i++) {slides[i].style.display = "none";}
for (i = 0; i < dots.length; i++) {dots[i].className = dots[i].className.replace(" active", "");}
  if (slideIndex > slides.length) {slideIndex = 1;}
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
  timer=setTimeout(autoSlides, ti); 
    slideIndex++;
    tc++;
if (tc > loopcounts) {clearTimeout(timer);}
}  