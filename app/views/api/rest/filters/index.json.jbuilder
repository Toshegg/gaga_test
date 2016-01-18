json.filters do
  json.array! @filters, partial: 'api/rest/filters/filter', as: :filter
end
