json.games do
  json.array! @games, partial: 'api/rest/games/game', as: :game
end
