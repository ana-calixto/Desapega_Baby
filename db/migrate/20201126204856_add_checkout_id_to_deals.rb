class AddCheckoutIdToDeals < ActiveRecord::Migration[6.0]
  def change
    add_column :deals, :checkout_session_id, :string
  end
end
