class AddDogToGuests < ActiveRecord::Migration[7.0]
  def change
    add_column :guests, :dog, :boolean
  end
end
