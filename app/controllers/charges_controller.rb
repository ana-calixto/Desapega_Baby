class ChargesController < ApplicationController
  def new
  end
  
  def create
    # Amount in cents
    @amount = 
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: user.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'brl',
    })
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
