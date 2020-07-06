require 'slack-ruby-bot'
require 'net/http'
require 'json'


module RidaBot
  class Weather < SlackRubyBot::Commands::Base
    #attr_writer :city, :zip
    require 'httparty'
    key='bdc41b55a4c712c6598fce628e1a5254'
    response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=fez&&APPID=#{key}")
    res= response['weather']
    command 'get_weather' do |client, data, _match|
    client.web_client.chat_postMessage(channel: data.channel, text: "the scay will be :#{res[0]['description']} ")
    client.web_client.chat_postMessage(channel: data.channel, text: "the scay will be :#{_match} ")
    end
  end
end
