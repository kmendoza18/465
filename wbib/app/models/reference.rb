class Reference < ActiveRecord::Base

	before_validation(:url) do
		unless self.url[/\Ahttp:\/\//] || self.url[/\Ahttps:\/\//]
			self.url = "http://#{self.url}"
		end
	end

	validates :topic, presence: true
	validates :annotation, presence: true
	validates :url, presence: true
end
