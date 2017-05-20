class AddApproveToSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :approved, :boolean, default: false
  end
end
