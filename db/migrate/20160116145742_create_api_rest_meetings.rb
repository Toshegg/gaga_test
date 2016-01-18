class CreateApiRestMeetings < ActiveRecord::Migration
  def change
    create_table :api_rest_meetings do |t|
      t.string :name
      t.datetime :starts_at
      t.datetime :ends_at
      t.float :lat
      t.float :lng

      t.timestamps null: false
    end
  end
end
