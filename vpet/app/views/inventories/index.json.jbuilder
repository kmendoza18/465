json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :item_name, :item_effect, :item_des, :money, :user_id
  json.url inventory_url(inventory, format: :json)
end
