class ScraperAppStore::App < ScraperAppStore::Base
	DEFAULT_URL = "https://itunes.apple.com/lookup"

	def initialize( options = {} ) #params id or app_id
		raise "require Id (TrackId) or AppId (bundleId) " unless options[:id] || options[:app_id]
		id_field = options[:id] ? "id" : "bundleId"
		id_value = options[:id] || options[:app_id]
    country = options[:country] || ''
				
		@agent = Mechanize.new

		unless exist?("#{DEFAULT_URL}?#{id_field}=#{id_value}&country=#{country}")
			@page = nil
		else 
			@page = @agent.get("#{DEFAULT_URL}?#{id_field}=#{id_value}&country=#{country}")
		end

		@info = @page.body
	end

	def info
		hash_info = JSON.parse(@info)["results"][0]
		
		@app_info = {
			id: hash_info['trackId'],
			app_id: hash_info['bundleId'],
			name: hash_info["trackName"] ,
			logo: hash_info['artworkUrl512'] || hash_info['artworkUrl100'] || hash_info['artworkUrl60'],
			screen_shots: hash_info['screenshotUrls'],
			developer: hash_info['artistName'],
			address: "",
			email: hash_info['sellerUrl'], 
			title: hash_info["trackName"],
			genre_text: hash_info['genres'],
			genre_id: hash_info['genresIds'],
			version: hash_info['version'],
			description: hash_info['description'],
			android_version_text: "",
			android_version: hash_info['minimumOsVersion'],
			contentRating: hash_info['contentAdvisoryRating'],
			size: hash_info['fileSizeBytes'],
			video: "",
			score: hash_info['averageUserRating'],
		}	

	end

end