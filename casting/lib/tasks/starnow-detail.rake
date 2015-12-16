# http://robdodson.me/crawling-pages-with-mechanize-and-nokogiri/

# run with: 
# rake scrape:basic
require 'mechanize'

namespace :scrape  do
  desc "Scraping Star Now"
  task detail: :environment do
    prepare_users 
  end
end

def prepare_users 
	agent = Mechanize.new

	# Users.all do user 
	# 	page  = agent.get(user.profile_url)
	# 	scrape(page)
	# end

	scrape(agent.get(User.first.profile_url), User.first)
end

def scrape(page, user)
	physical_attributes = page.parser.css('#section5')
	user.height      = physical_attributes.at('td:contains("Height:")').text.strip
	user.weight      = physical_attributes.at('td:contains("Weight:")').text.strip
	user.ethnicity   = physical_attributes.at('td:contains("Ethnicity:")').text.strip
	user.skin_color  = physical_attributes.at('td:contains("Skin colour:")').text.strip
	user.eye_color   = physical_attributes.at('td:contains("Eye colour:")').text.strip
	user.chest       = physical_attributes.at('td:contains("Chest:")').text.strip
	user.waist       = physical_attributes.at('td:contains("Waist:")').text.strip
	user.hips        = physical_attributes.at('td:contains("Hips:")').text.strip
	user.shoe_size   = physical_attributes.at('td:contains("Show size:")').text.strip
	user.hair_colour = physical_attributes.at('td:contains("Hair colour:")').text.strip
	user.hair_length = physical_attributes.at('td:contains("Hair length:")').text.strip
	user.hair_type   = physical_attributes.at('td:contains("Hair type:")').text.strip
	user.dress_size  = physical_attributes.at('td:contains("Dress size:")').text.strip
	user.save
end