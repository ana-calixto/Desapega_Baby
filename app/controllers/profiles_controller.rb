class ProfilesController < ApplicationController
  def show
    @profile = User.find(params[:id])
    @reviews = @profile.received_reviews
  end
end
