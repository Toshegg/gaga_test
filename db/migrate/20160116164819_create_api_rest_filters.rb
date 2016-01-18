class CreateApiRestFilters < ActiveRecord::Migration
  def change
    create_table :api_rest_filters do |t|
      t.json :value
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
