class AddStatusToSales < ActiveRecord::Migration[6.1]
  def change
    add_column :sales, :status, :string
  end
end
