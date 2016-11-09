class AddDimensionsToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :dimensions, :string
  end
end
