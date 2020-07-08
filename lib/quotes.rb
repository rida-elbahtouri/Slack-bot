require 'slack-ruby-bot'
require 'json'
require 'httparty'
require 'open-uri'
module RidaBot
  class Quotes < SlackRubyBot::Commands::Base
    def quote_api
      response = HTTParty.get('https://type.fit/api/quotes')
      res = JSON.parse(response)
      i = rand(1..(res.length - 1))
      res[i]
    end
    command 'can you give me a random quote?' do |client, data, _match|
      qu = new
      client.web_client.chat_postMessage(channel: data.channel, text: "
        your random quote will be :\n#{qu.quote_api['text']} \n by #{qu.quote_api['author']} ")
    end
  end
end
