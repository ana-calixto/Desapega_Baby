class ReviewsController < ApplicationController
  def show
    @reviews = Review.all
  end

  def new
    @user = Product.owner
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @user = Product.owner
    @review.user = @user
    @review.save
    # Redireciona pro perfil do vendedor
    redirect_to profile_path(@user)
  end

  def edit
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def update
    @review = Review.new(review_params)
    @user = User.find(params[:user_id])
    @review.user = @user
    @review.save
    redirect_to products_path
  end

  private

  def review_params
    params.require(:review).permit(:content, :raiting)
  end

end
