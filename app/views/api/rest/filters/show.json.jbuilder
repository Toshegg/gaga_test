json.filter do
  json.partial! 'api/rest/filters/filter', filter: @filter
end
