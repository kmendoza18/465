json.array!(@shops) do |shop|
  json.extract! shop, :id, :item_name, :item_des, :price, :user_id
  json.url shop_url(shop, format: :json)
end
