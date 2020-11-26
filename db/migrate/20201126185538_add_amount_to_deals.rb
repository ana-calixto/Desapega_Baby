class AddAmountToDeals < ActiveRecord::Migration[6.0]
  def change
    add_column :deals, :amount, :float
  end
end
