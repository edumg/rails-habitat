class OrdersController < ApplicationController
 def create
  @booking = Booking.find(params[:booking_id])
  order  = Order.create!(booking_sku: @booking.sku, amount: @booking.price, state: 'pending')

  redirect_to new_order_payment_path(order)
end

def show
  @order = Order.where(state: 'paid').find(params[:id])
end

end
