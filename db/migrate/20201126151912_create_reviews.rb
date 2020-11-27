class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :raiting
      t.references :user, null: false, foreign_key: true
      t.references :owner, foreign_key: {to_table: "users"}
      t.timestamps
    end
  end
end
