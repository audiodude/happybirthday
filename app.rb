# app.rb
require 'sinatra'
require 'erb'
require 'date'

before do
  @person = {}
  @person[:first] = 'Christian'
  @person[:last] = 'Rodriguez'
  @person[:birthday] = Date.commercial(2011, 21, 7) #see Date docs
  @person[:birthday_next] = Date.commercial(Date.today.year, @person[:birthday].cweek, @person[:birthday].cwday)
  @person[:birthday_next] += 365 if @person[:birthday_next] - Date.today < 0
end

def is_birthday?
  Date.today == @person[:birthday]
end

get '/' do
  if is_birthday?
    @words = []
    erb :form
  else
    @countdown = @person[:birthday_next] - Date.today
    erb :countdown
  end
end

get '/birthday' do
  erb :uhuhuh
end

post '/birthday' do
  unless is_birthday?
    erb :uhuhuh
    return
  end
  
  @words = params.to_a
end