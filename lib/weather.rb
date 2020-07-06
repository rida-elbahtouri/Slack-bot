require 'slack-ruby-bot'
require 'json'
require 'httparty'
require 'dotenv'
module RidaBot
  class Weather < SlackRubyBot::Commands::Base
    command 'can you tell me the weather in' do |client, data, match|
      q = match[:expression].delete! '?'
      q.delete! ' ' if q.include? ' '
      key = Dotenv.load['weather_api']
      response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=#{q}&&APPID=#{key}")
      if response['cod'] == 200
        res = response['weather'][0]['description']
        client.web_client.chat_postMessage(channel: data.channel, text: "the weather will be : #{res} ")
      else
        res = "sorry we couldn't find this city"
        client.web_client.chat_postMessage(channel: data.channel, text: "#{res} ")
      end
    end
  end
end
