class AddFlagToComments < ActiveRecord::Migration[5.0]
  def change
  	add_column :comments, :flag, :boolean, default: false, null: false
  end
end
