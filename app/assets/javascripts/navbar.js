$(window).scroll(function() {
  if($(this).scrollTop() > 50)  /*height in pixels when the navbar becomes non opaque*/
  {
    $('.opaque-navbar').addClass('opaque');
    $('.navbar-inverse .navbar-nav>li>a').css('color', '#191919');


  } else {
    $('.opaque-navbar').removeClass('opaque');
    $('.navbar-inverse .navbar-nav>li>a').css('color', 'white');

  }
});
