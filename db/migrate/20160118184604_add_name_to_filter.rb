class AddNameToFilter < ActiveRecord::Migration
  def change
    add_column :api_rest_filters, :name, :string
  end
end
