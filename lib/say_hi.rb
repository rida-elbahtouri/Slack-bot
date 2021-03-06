require 'slack-ruby-bot'
require_relative './quotes.rb'
module RidaBot
  class SayHi < SlackRubyBot::Commands::Base
    class Quote < Quotes
      def generate_quote
        "the quote chosen for you is :\n#{quote_api['text']} \n by #{quote_api['author']} "
      end
    end
    command 'hello there' do |client, data, _match|
      qut = Quote.new
      client.web_client.chat_postMessage(channel: data.channel, text: qut.generate_quote)
      client.web_client.chat_postMessage(channel: data.channel, text: "
        Hello and welocome \n you can check commands by typing help after taging me")
    end
  end
end
