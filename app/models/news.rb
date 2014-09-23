class News < ActiveRecord::Base
	resourcify
	validates_presence_of :body, :title
end
