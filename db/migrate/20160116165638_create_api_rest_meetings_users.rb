class CreateApiRestMeetingsUsers < ActiveRecord::Migration
  def change
    create_table :api_rest_meetings_users do |t|
      t.integer :meeting_id
      t.integer :user_id
    end
  end
end
