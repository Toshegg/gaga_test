class CreateApiRestMeetingsGames < ActiveRecord::Migration
  def change
    create_table :api_rest_games_meetings do |t|
      t.integer :game_id
      t.integer :meeting_id
    end
  end
end
