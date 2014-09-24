json.array!(@newspapers) do |newspaper|
  json.extract! newspaper, :id, :title, :description
  json.url newspaper_url(newspaper, format: :json)
end
