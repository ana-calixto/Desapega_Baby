class AddStatusToDeals < ActiveRecord::Migration[6.0]
  def change
    add_column :deals, :status, :string
  end
end
