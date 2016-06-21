# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	Reference.create(url: 'https://www.amazon.com', topic: 'Amazon', annotation: 'Shopping')
	Reference.create(url: 'https://www.facebook.com', topic: 'Facebook', annotation: 'Social Network')
	Reference.create(url: 'https://www.google.com', topic: 'Google', annotation: 'Search Engine')
	Reference.create(url: 'https://www.yahoo.com', topic: 'Yahoo!', annotation: 'Web Portal')
	Reference.create(url: 'https://www.newegg.com', topic: 'Newegg', annotation: 'Shopping')
	Reference.create(url: 'https://www.stackoverflow.com', topic: 'Stack Overflow', annotation: 'Q&A')
	Reference.create(url: 'https://thepiratebay.se', topic: 'The Pirate Bay', annotation: 'Index')
	Reference.create(url: 'https://www.youtube.com', topic: 'YouTube', annotation: 'Entertainment')
	Reference.create(url: 'https://www.bankofamerica.com', topic: 'Bank of America', annotation: 'Finance')
	Reference.create(url: 'https://github.com', topic: 'GitHub', annotation: 'Repository Hosting')
