class RenameCostomerIdColumnToAddresses < ActiveRecord::Migration[6.1]
  def change
    rename_column :addresses, :costomer_id, :customer_id
  end
end
