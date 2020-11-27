class ReviewsController < ApplicationController

  def create
    @deal = Deal.find(params[:deal_id])
    @review = Review.new(review_params)
    @review.user = @deal.user
    @review.owner = @deal.product.owner
    if @review.save
      profile_path(@deal.product.owner)
    else
      render "deals/show"
    end
    # Redireciona pro perfil do vendedor
    redirect_to profile_path(@review.owner)
  end

  private

  def review_params
    params.require(:review).permit(:content, :raiting)
  end

end
