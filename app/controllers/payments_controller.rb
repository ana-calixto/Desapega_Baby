class PaymentsController < ApplicationController
  def new
    @deal = current_user.deals.where(state: 'pending').find(params[:deal_id])
  end
end
