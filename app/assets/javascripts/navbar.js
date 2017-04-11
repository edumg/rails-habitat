$(window).scroll(function() {
  //behavior homepage
  if(window.location.href.split("/")[3] == "") {
    console.log($(this).scrollTop());
    if($(this).scrollTop() < 50){
      $('#navbar-master').removeClass('opaque');
      $('.navbar-inverse .navbar-nav>li>a').css('color', 'black');
    } else {
      if($(this).scrollTop() > 99) {
        $('#navbar-master').addClass('opaque');
        $('.navbar-inverse .navbar-nav>li>a').css('color', 'black');
      } else {
         $('#navbar-master').removeClass('opaque');
         $('.navbar-inverse .navbar-nav>li>a').css('color', 'white');
      }
    }
  } else {
    $('#navbar-master').addClass('opaque');
    $('.navbar-inverse .navbar-nav>li>a').css('color', 'black');
  }
});

