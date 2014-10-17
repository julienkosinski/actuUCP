if Rails.env == "development"
	begin
		app_secret = YAML.load_file('app_secret.yml')
		$client = Twitter::REST::Client.new do |config|
		config.consumer_key        = app_secret['consumer_key']
		config.consumer_secret     = app_secret['consumer_secret']
		config.access_token        = app_secret['access_token']
		config.access_token_secret = app_secret['access_token_secret']
	end
	rescue Errno::ENOENT => e
		puts "ERROR missing app_secret.yml - Please insert an app_secret.yml file in your root directory containing your credentials for twitter connection.".red.bold
	end
else
	$client = Twitter::REST::Client.new do |config|
		config.consumer_key        = ENV['twitter_consumer_key']
		config.consumer_secret     = ENV['twitter_consumer_secret']
		config.access_token        = ENV['twitter_access_token']
		config.access_token_secret = ENV['twitter_access_token_secret']
	end
end