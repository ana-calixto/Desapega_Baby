class ProfilesController < ApplicationController
  def show
    @profile = User.find(params[:id])
    @reviews = @profile.received_reviews
    if @reviews.count == 0
      redirect_to products_path
    else
      total_raiting = 0
      @reviews.each do |review|
        total_raiting += review[:raiting]
      end
      @raiting = total_raiting / @reviews.count
    end
  end
end
