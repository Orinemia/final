json.array!(@cics) do |cic|
  json.extract! cic, :id, :presidency, :president, :took_office, :left_office, :party, :image, :state, :term, :biography
  json.url cic_url(cic, format: :json)
end
