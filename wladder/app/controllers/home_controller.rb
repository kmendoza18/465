class HomeController < ApplicationController

# This file is ruby. It adds variables for your views to use

load "#{Rails.root}/lib/ladder.rb"

  def index
    # don't need to do anything here
  end

  def show
    iter = 0
    @query_text = Array.new
    @query_text << params[:query1]
    @query_text << params[:query2]
    @query_text << params[:query3]
    @query_text << params[:query4]
    @query_text << params[:query5]

    if @query_text[iter] =~ /^[a-z]*$/
	if edit_distance_of_one(@query_text[iter], @query_text[iter + 1])
		if legal(@query_text[iter])
			# Everything true/legal
			iter += 1
      			@result = ["You Win Mofo!"]
		else
			@result = ["Illegal Word"];
		end
	else
		@result = ["Illegal Word"];
	end
    else
      @result = ["Illegal Word"];
    end

  end

end
