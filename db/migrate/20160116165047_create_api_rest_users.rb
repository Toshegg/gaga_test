class CreateApiRestUsers < ActiveRecord::Migration
  def change
    create_table :api_rest_users do |t|
      t.string :nickname

      t.timestamps null: false
    end
  end
end
