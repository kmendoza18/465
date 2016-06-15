class HomeController < ApplicationController

load "#{Rails.root}/lib/ladder.rb"

  def index
    # don't need to do anything here
  end

  def show
    @query_text = params[:query]
    if @query_text =~ /^[a-z]*$/
      @result = `whois #{@query_text}`.split("\n")
    else
      @result = ["Invalid Input"];
    end
  end

end
