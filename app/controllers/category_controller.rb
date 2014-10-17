class CategoryController < ApplicationController

	def index
	    @categories = Category.all
	end

	def show_sport
		@cat_sport = Category.find(1)
	end
end
