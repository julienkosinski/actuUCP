class Newspaper < ActiveRecord::Base
	resourcify
	require 'twitter'

	def retrieveTweetFromAccountUCPCergy
		#return $client.search("from:UniversiteCergy", :result_type => "recent").take(200).collect do |tweet|
			#{}"#{tweet.user.screen_name}: #{tweet.text} #{tweet.created_at}"
					return $client.search("from:UniversiteCergy", :result_type => "recent").take(10).collect

	end
	def retrieveTweetFromAccountRPUCP
		return $client.search("from:rp_ucp", :result_type => "recent").take(10).collect
			#{}"#{tweet.user.screen_name}: #{tweet.text}"
	end
	def retrieveTweetFromAccountUCPAssoLide
		return $client.search("from:LIDEdeCergy", :result_type => "recent").take(10).collect
			#{}"#{tweet.user.screen_name}: #{tweet.text}"
	end
end
