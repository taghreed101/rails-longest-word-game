
class GamesController < ApplicationController
  def new
    array=('A'..'Z').to_a
    @letters= array.sample(10)
  end

  def score
    
   
  
    @letters=params[:letters].split
    @word= params[:name]
    @url = "https://recode-dictionary.herokuapp.com/#{@word}"
    @response = HTTParty.get(@url)
    
   
    
    @diffnt=params[:name].split("")-params[:letters].split
    byebug
    if @diffnt.empty? 
      
      if @response["found"] != true
        @result="Sorry but #{@word} does not seem to be a vaild English word"
      else 
        @result="Congratulations! #{@word} is a vaild English word"
      end
    else
      
      @result="sorry but #{@word} can't be built out of #{@letters} "  
    end

  end
end
