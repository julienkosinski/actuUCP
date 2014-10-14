class Newspaper < ActiveRecord::Base
	require 'twitter'
	def twitterUCPCergy
		return $client.search("from:UniversiteCergy", :result_type => "recent").take(200).collect do |tweet|
			"#{tweet.user.screen_name}: #{tweet.text}"
		end
	end
	def twitterRPUCP
		return $client.search("from:rp_ucp", :result_type => "recent").take(200).collect do |tweet|
			"#{tweet.user.screen_name}: #{tweet.text}"
		end
	end
	def twitterUCPAssoLide
		return $client.search("from:LIDEdeCergy", :result_type => "recent").take(200).collect do |tweet|
			"#{tweet.user.screen_name}: #{tweet.text}"
		end
	end
end
