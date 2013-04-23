$(document).ready(function(){
  var imgArr = new Array( // relative paths of images
    '/assets/stretcher/campsite.jpg',
    '/assets/stretcher/campsite_2.jpg',
    '/assets/stretcher/campsite_3.jpg',
    '/assets/stretcher/campsite_4.jpg');

  /* preload images */
  var preloadArr = new Array();
  var i;
  for(i=0; i < imgArr.length; i++) {
    preloadArr[i] = new Image();
    preloadArr[i].src = imgArr[i];
  }

  var currImg = 1;
  var intID = setInterval(changeImg, 6000);
  /* image rotator */
  function changeImg(){
    $('.stretcher').animate({opacity: 0}, 'slow', function() {
      $(this).css('background-image', 'url('+preloadArr[currImg++%preloadArr.length].src+')');
    }).animate({opacity: 1});
  }
});
