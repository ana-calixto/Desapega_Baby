class ProfilesController < ApplicationController
  def show
    @user_profile = User.find(params[:id])
    @reviews = @user_profile.reviews
    total_raiting = 0
    @reviews.each do |review|
      total_raiting += review[:raiting]
    end
    @raiting = total_raiting / @reviews.count
  end
end
