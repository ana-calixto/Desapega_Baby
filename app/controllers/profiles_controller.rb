class ProfilesController < ApplicationController
  def show
    @profile = User.find(params[:id])
    @reviews = @profile.received_reviews
    @fivestars = @reviews.select{ |r| r.raiting == 5 }
    @fivestarspercent = (@fivestars.count / @reviews.count) *100
  end
end
