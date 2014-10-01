class Newspaper < ActiveRecord::Base
	require 'twitter'
	def twitterConnect
		if Rails.env == "development"
			app_secret = YAML.load_file('app_secret.yml')
			@client = Twitter::REST::Client.new do |config|
				config.consumer_key        = app_secret['consumer_key']
				config.consumer_secret     = app_secret['consumer_secret']
				config.access_token        = app_secret['access_token']
				config.access_token_secret = app_secret['access_token_secret']
			end
		else
			@client = Twitter::REST::Client.new do |config|
				config.consumer_key        = ENV['twitter_consumer_key']
				config.consumer_secret     = ENV['twitter_consumer_secret']
				config.access_token        = ENV['twitter_access_token']
				config.access_token_secret = ENV['twitter_access_token_secret']
			end
		end
	end
	def twitterUCPSearch
		puts twitterConnect()
		return @client.search("@iut_ucp")
	end
end
