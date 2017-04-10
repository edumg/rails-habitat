
// current_user.profile.booking.each do |booking| {
//   console.log(booking);
//   if (booking.status === "PAYMENT") {
//     $('#booking_card').addClass('card-payment').removeClass('card-sign');
//   }

//   if (booking.status === "CONTRACT") {
//     $('#booking_card').addClass('card-sign').removeClass('card-payment');
//   }
// }


$(window).scroll(function() {
  $('#booking-date').on('click', function(){
      console.log(document.getElementById('booking_start_date_1i').value);
  });
});
