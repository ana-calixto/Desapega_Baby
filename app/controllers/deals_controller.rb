class DealsController < ApplicationController
  def index 
    @deals = Deal.all 
  end

  def show
    @deal = Deal.find(params[:id])
  end

  def create
    @deal = Deal.new
    @product = Product.find(params[:product_id])
    @deal.user = current_user
    @deal.product = @product
    @deal.save!
    redirect_to products_path
  end

end
