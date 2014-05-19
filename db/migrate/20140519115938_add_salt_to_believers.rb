class AddSaltToBelievers < ActiveRecord::Migration
  def change
    add_column :believers, :salt, :string
  end
end
