$(function () {
/*
 * slideshow
 */

  $('.main__slideshow').each(function () {

    var $slides = $(this).find('img'),
        slideCount = $slides.length,
        currentIndex = 0;

    $slides.eq(currentIndex).fadeIn();

    setInterval(showNextSlide,1000);
    
    function showNextSlide () {
      var nextIndex = (currentIndex + 1) % slideCount;

      $slides.eq(currentIndex).fadeOut();
      $slides.eq(nextIndex).fadeIn();
      currentIndex = nextIndex;
    }
  }); 
});
