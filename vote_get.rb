require 'rubygems'
require 'mechanize'
require 'sinatra/base'
require 'slim'
require 'date'

class MyApp < Sinatra::Base

  configure do
    enable :sessions
  end

  get '/index' do

    log = File.open(File.expand_path("../log/#{Time.now.strftime '%Y%m%d'}.log", __FILE__), "a")
    log.puts 'スクリプト開始'

    @date = Date.today
    if session[:last_date] != @date then
      @vote_result = '投票完了'
    elsif session[:last_date] == @date then
      @vote_result = '本日は既に投票済みです'
    else
      @vote_result = '不明なエラーです'
    end
    session[:last_date] = @date
    slim :index
  end

  post '/index' do
    @value = "#{params[:data]}"
  end

end

MyApp.run!
