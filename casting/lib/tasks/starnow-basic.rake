# http://robdodson.me/crawling-pages-with-mechanize-and-nokogiri/

# run with: 
# rake scrape:basic
require 'mechanize'

namespace :scrape  do
  desc "Scraping Star Now"
  task basic: :environment do
    scrape
  end
end

def scrape(page_count=1)
	base_url   = "http://www.starnow.co.uk"
	path       = "/talent/uk/"
	url        = "#{base_url}#{path}?p=#{page_count}" 
	p "Scraping #{url}"
	p "Page: #{page_count}"

	agent = Mechanize.new
	page  = agent.get(url)

	headshots = page.parser.css('a.headshot')

	if (headshots.count > 0) 
		headshots.each do |link|
		  image       = link.css('img').map { |img| img['src'] }.try(:first)
		  profile_url = base_url+link['href']
		 	location    = link.css('.details__location').try(:first).try(:content)
		 	first_name  = link.css('.display-name').try(:first).try(:content)

		 	user = User.find_by_profile_url(profile_url)
		 	if user
		 		p "#{user} was already in the database"
		 	else 
			  user = User.create!({
			  	profile_url: profile_url,
			  	image: image,
			  	location: location,
			  	first_name: first_name
			  })
			  p "#{user} was created"
			end
		end
	else 
		p "Rake task finished. No headshots found."
	end
	p 
	scrape(page_count+=1)
end