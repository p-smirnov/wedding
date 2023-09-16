class AddChildUnderThreeToPlusOnes < ActiveRecord::Migration[7.0]
  def change
    add_column :plus_ones, :child_under_three, :boolean
  end
end
