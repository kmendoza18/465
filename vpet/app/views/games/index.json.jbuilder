json.array!(@games) do |game|
  json.extract! game, :id, :g_name, :g_des, :money, :pet_id
  json.url game_url(game, format: :json)
end
