
current_user.profile.booking.each do |booking| {
  console.log(booking);
  if (booking.status === "PAYMENT") {
    $('#booking_card').addClass('card-payment').removeClass('card-sign');
  }

  if (booking.status === "CONTRACT") {
    $('#booking_card').addClass('card-sign').removeClass('card-payment');
  }
}
