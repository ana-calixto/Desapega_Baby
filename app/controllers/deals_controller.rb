class DealsController < ApplicationController
  def index
    @deals = Deal.all
  end

  def show
    @deal = Deal.find(params[:id])
  end

  # def create
  #   @deal = Deal.new
  #   @product = Product.find(params[:product_id])
  #   @product.available = false
  #   @deal.user = current_user
  #   @deal.product = @product
  #   @product.save!
  #   @deal.save!
  #   redirect_to deal_path(@deal)

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
