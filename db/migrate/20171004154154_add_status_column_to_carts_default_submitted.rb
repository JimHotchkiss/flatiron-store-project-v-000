class AddStatusColumnToCartsDefaultSubmitted < ActiveRecord::Migration
  def change
    add_column :carts, :status, :string, :default => 'submitted'
  end
end
