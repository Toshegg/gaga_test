class CreateApiRestGames < ActiveRecord::Migration
  def change
    create_table :api_rest_games do |t|
      t.string :name
      t.integer :players_number

      t.timestamps null: false
    end
  end
end
