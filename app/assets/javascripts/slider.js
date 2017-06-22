var slideIndex=1;
window.onload=function() { showSlides(slideIndex); }

function plusSlides(n){
  showSlides(slideIndex += n);// посылаем число в слайд
}

function showSlides(n){ // обрабатываем число
  console.log("n:" + n);
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  
  if(n > slides.length){
  console.log(slides);
	  slideIndex = 1;
  }
  if(n < 1){ 
    console.log(slides);
    slideIndex = slides.length;
  }
  for(i=0; i<slides.length; i++){
	  slides[i].style.display = "none";
  }
  slideIndex++;
  slides[slideIndex-1].style.display = "block";
  setTimeout(showSlides, 2000);
}
