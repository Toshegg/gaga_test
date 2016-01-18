json.meetings do
  json.array! @meetings, partial: 'api/rest/meetings/meeting', as: :meeting
end
