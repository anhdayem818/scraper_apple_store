class ScraperAppStore::Base
	def exist?(url)
  	uri = URI("#{url}")
		status_code = Net::HTTP.get_response(uri).code
		case status_code
		when '200'
			return true
		when '404'
			return false
		else
			return false
		end
  end
end