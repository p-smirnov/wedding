class AddStayingOvernightToGuests < ActiveRecord::Migration[7.0]
  def change
    add_column :guests, :staying_overnight, :boolean
  end
end
