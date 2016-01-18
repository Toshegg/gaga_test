json.meeting do
  json.partial! 'api/rest/meetings/meeting', meeting: @meeting
end
