class DealsController < ApplicationController
  def index
    @deals = Deal.all
  end

  def show
    @deal = Deal.find(params[:id])
    @review = Review.new
  end

  def create
    product = Product.find(params[:product_id])
    deal  = Deal.create!(product: product, amount: product.price, status: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: product.name,
        amount: (product.price * 100).to_i,
        currency: 'brl',
        quantity: 1
      }],
      success_url: deal_url(deal),
      cancel_url: deal_url(deal)
    )

    deal.update(checkout_session_id: session.id)
    redirect_to new_deal_payment_path(deal)
  end
end
