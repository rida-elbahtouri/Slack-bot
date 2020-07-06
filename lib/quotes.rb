
require 'slack-ruby-bot'
require 'json'
require 'httparty'

module RidaBot
  class Quotes < SlackRubyBot::Commands::Base
    attr_reader :res, :i
    response = HTTParty.get('https://type.fit/api/quotes')
    res = JSON.parse(response)
    i = rand(1..(res.length - 1))
    @@i = i
    @@res = res
    command 'can you give me a random quotes?' do |client, data, _match|
      client.web_client.chat_postMessage(channel: data.channel, text: "your random quote will be :\n#{res[i]['text']} \n by #{res[i]['author']} ")
    end
  end
end
