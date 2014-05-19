class AddPasswordToBelievers < ActiveRecord::Migration
  def change
    add_column :believers, :encrypted_password, :string
  end
end
