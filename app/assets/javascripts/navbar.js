$(window).scroll(function() {

  //behavior homepage
  if(window.location.href.split("/")[3] == "") {
    if($(this).scrollTop() < 30){
      $('.navbar-inverse .navbar-nav>li>a').css('color', 'black');
    } else {
      if($(this).scrollTop() > 262) {
        $('.opaque-navbar').addClass('opaque');
        $('.navbar-inverse .navbar-nav>li>a').css('color', 'black');
      } else {
         $('.opaque-navbar').removeClass('opaque');
         $('.navbar-inverse .navbar-nav>li>a').css('color', 'white');
      }

    }
  } else {
    $('.opaque-navbar').addClass('opaque');
    $('.navbar-inverse .navbar-nav>li>a').css('color', 'black');
  }
});
