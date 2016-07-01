json.array!(@pets) do |pet|
  json.extract! pet, :id, :name, :sex, :health, :clean, :mood, :status, :asleep, :strength, :defense, :age, :highscore_id
  json.url pet_url(pet, format: :json)
end
