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
	p "Beginning to update"
	User.all.each do |user| 
		next if !user.profile_url
		page  = agent.get(user.profile_url)
		scrape_detail(page, user)
	end
end

def scrape_detail(page, user)
	physical_attributes = page.parser.css('#section5')
	user.full_name = page.parser.css(".profile__name").try(:text).try(:strip)
	{
		height: "Height:",
		weight: "Weight:",
		ethnicity: "Ethnicity:",
		skin_color: "Skin colour:",
		eye_color: "Eye colour:",
		chest: "Chest:",
		waist: "Waist:",
		hips: "Hips:",
		shoe_size: "Shoe size:",
		hair_colour: "Hair colour:",
		hair_length: "Hair length:",
		hair_type: "Hair type:",
		dress_size: "Dress size:"
	}.each do |key, value|
		user.send("#{key}=", get_text_content(physical_attributes, value))
	end 
	user.save
	p "#{user.full_name} was updated"
end

def get_text_content(physical_attributes, attribute)
	physical_attributes.at("td:contains('#{attribute}')").try(:text).try(:gsub, attribute, "").try(:strip).try(:delete, " ")
end