require 'rubygems'
require 'mechanize'
require 'sinatra/base'
require 'slim'
require 'date'

class MyApp < Sinatra::Base

  get '/' do
    @date = Date.today
    @vote_result = '本日は既に投票済みです'
    #@vote_result = '投票完了'
    #@vote_result = '不明なエラーです'
    slim :index
  end
end


MyApp.run!
