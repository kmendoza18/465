json.array!(@games) do |game|
  json.extract! game, :id, :game_name, :game_des, :game_prize, :user_id
  json.url game_url(game, format: :json)
end
