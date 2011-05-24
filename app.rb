# app.rb
require 'sinatra'
require 'erb'
require 'date'

before do
  @person = {}
  @person[:first] = 'Christian'
  @person[:last] = 'Rodriguez'
  @person[:birthday] = Date.commercial(2011, 21, 2) #see Date docs
  @person[:birthday_next] = Date.commercial(Date.today.year, @person[:birthday].cweek, @person[:birthday].cwday)
  @person[:birthday_next] += 365 if @person[:birthday_next] - Date.today < 0
end

def is_birthday?
  Date.today == @person[:birthday]
end

def countdown
  @countdown = @person[:birthday_next] - Date.today
  erb :countdown
end

def birthday
  @words = %w- joking friends problem having party everything perfect quickly cake guests eat candy had time end party animal -
  params[:words].each_with_index do |word, i|
    @words[i] = word unless word.nil? || word.empty?
  end
  
  @words = @words.map(&:downcase)
  
  erb :birthday
end

get '/' do
  if is_birthday?
    erb :form
  else
    countdown
  end
end

get '/birthday' do
  unless is_birthday?
    erb :uhuhuh
  else
    birthday
  end
end