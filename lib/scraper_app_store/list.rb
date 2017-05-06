class ScraperAppStore::List < ScraperAppStore::Base
	DEFAULT_URL = "https://itunes.apple.com/${opts.country}/rss/"#${opts.collection}/limit=${opts.num}${category}/json"

	def initialize(collection, category = "", num = 50, opts = {})
		@agent = Mechanize.new
		category = "/genre=#{category}" if category != ""
		opts[:country] ||= 'us'
		@page = @agent.get("https://itunes.apple.com/#{opts[:country]}/rss/#{collection}/limit=#{num}#{category}/json")
		@result = JSON.parse @page.body
	end

	def apps
		list_apps = []
		list = @result["feed"]["entry"]
		list.each do |item|
			list_apps << item["id"]["attributes"]["im:bundleId"]
		end	
		list_apps
	end

end