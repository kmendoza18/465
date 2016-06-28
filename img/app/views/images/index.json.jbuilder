json.array!(@images) do |image|
  json.extract! image, :id, :filename, :status, :user_id
  json.url image_url(image, format: :json)
end
