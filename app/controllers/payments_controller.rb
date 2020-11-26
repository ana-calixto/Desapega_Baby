class PaymentsController < ApplicationController
  def new
    @deal = current_user.deals.where(status: 'pending').find(params[:deal_id])
  end
end
