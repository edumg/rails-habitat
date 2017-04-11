class PaymentsController < ApplicationController
  before_action :set_order

  def new
  end

def create
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @order.amount_cents, # or amount_pennies
    description:  "Payment for Apartment #{@order.booking_sku} for order #{@order.id}",
    currency:     @order.amount.currency
  )

  @order.update(payment: charge.to_json, state: 'paid')

  booking_upd = Booking.find_by sku: @order.booking_sku

  if booking_upd.nil?
    flash['alert'] = "Error when updating booking status to PAID!"
  else
    booking_upd.status = "PAID"
    booking_upd.save
  end

  redirect_to order_path(@order)

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_order_payment_path(@order)
end

private

  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
