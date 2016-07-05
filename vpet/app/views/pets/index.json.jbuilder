json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :sex, :health, :clean, :mood, :status, :asleep, :age, :money, :user, :user_id, :highscore_id, :user_id
  json.url pet_url(pet, format: :json)
end
