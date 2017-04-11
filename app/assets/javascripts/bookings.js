
$('#new-booking').click(function() {

  if (!$(this).hasClass("done")) {
    $(this).toggleClass("available");
    update_booking_status("booking");
    alert('Booking status has changed!');
  }

});


$('#new-payment').click(function() {

  if (!$('#new-booking').hasClass("available")){
    alert('First set booking as available!');
  } else {
    if (!$(this).hasClass("done")) {
      var booking_id = $("#booking-id").text();
      // console.log(window.location.href.split("/")[4]);
      $(this).toggleClass("available");
      update_booking_status("payment");
      alert('Payment status has changed!');
    }
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
  var listing_id = window.location.href.split("/")[4];
  var ref_value = $('#ref').val();
  $.ajax({
    url: '/bookings/mark_as_available_to_pay',
    type: 'put'
    error: function(data){
      alert('Error occurred while updating the record.');
    },
    success: function(data){
      alert('Record updated successfully.');
    }
  });
    return false;
}
