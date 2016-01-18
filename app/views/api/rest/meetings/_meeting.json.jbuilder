json.(meeting, :id, :name, :starts_at, :ends_at)

json.location do
  json.lat meeting.lat
  json.lng meeting.lng
end

json.games do
  json.array! meeting.games, partial: 'api/rest/games/game', as: :game
end
