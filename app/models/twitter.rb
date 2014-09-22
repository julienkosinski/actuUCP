class Twitter < ActiveRecord::Base
	def self.data
		test = ['sss','sss']
		test.each do |test|
			Twitter.create(name: test)
		end
	end
end
