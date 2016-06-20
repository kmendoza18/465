class CreateReferences < ActiveRecord::Migration
	def change
		create_table :references do |r|
			r.text :url
			r.string :topic
			r.string :annotation
			r.datetime :timedate
		end
	end
end
