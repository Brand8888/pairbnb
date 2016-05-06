class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|

      t.integer :user_id
      t.string  :name
      t.string  :desc
      t.string  :country
      t.string  :state
      t.string  :city
      t.string  :address
      t.integer  :property_type
      t.integer  :room_type
      t.integer  :no_of_guest
      t.integer  :price_per_night

      t.timestamps null: false
    end
  end
end
