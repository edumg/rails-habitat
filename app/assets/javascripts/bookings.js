var delayMillis = 4000; //1 second



$('#booking_page').click(function() {
  setTimeout(function() {
  $('#payment-button').removeClass('hidden');
}, delayMillis);


});


$('#new-booking').click(function() {

$(this).addClass("done");
});


$('#new-payment').click(function() {


    if (!$(this).hasClass("done")) {
      var booking_id = $("#booking-id").text();
      // console.log(window.location.href.split("/")[4]);
      $(this).toggleClass("available");
      update_booking_status("payment");
      alert('Payment status has changed!');
    }

});


$('#new-contract').click(function() {

  if (!$('#new-payment').hasClass("available")){
    alert('First set payment as available!');
  } else {
    if (!$(this).hasClass("done")) {
      $(this).toggleClass("available");
      update_booking_status("contract");
      alert('Contract status has changed!');
    }
  }

});


function update_booking_status(new_status){

  return true;
}
