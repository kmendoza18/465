class HomeController < ApplicationController

# This file is ruby. It adds variables for your views to use

load "#{Rails.root}/lib/ladder.rb"
load "#{Rails.root}/lib/words4.rb"

$initWord = String.new
$endWord = String.new

  def index
    @initWord = dictionary.sample
    @endWord = dictionary.sample
    
    if @initWord == @endWord
	@endWord = dictionary.sample
    end 

    $initWord = @initWord
    $endWord = @endWord
 end

  def show
    iter = 0
    @query_text = Array.new
    @query_text << $initWord
    @query_text << params[:query1]
    @query_text << params[:query2]
    @query_text << params[:query3]
    @query_text << params[:query4]
    @query_text << params[:query5]
    
    @query_text << $endWord

    @query_text.reject! {|i| i.empty?}

    if @query_text[iter] =~ /^[a-z]*$/
	if edit_distance_of_one(@query_text[iter], @query_text[iter + 1])
		if legal(@query_text)
			# Everything true/legal
			iter += 1
      			@result = "You Win!";
		else
			@result = "You Lose!";
		end
	else
		@result = "Illegal Word Change";
	end
    else
      @result = "Invalid Word. Must Be Lower Case";
    end

  end

end
