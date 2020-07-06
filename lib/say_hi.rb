require 'slack-ruby-bot'

module RidaBot
  class SayHi < SlackRubyBot::Commands::Base
    command 'say_hi' do |client, data, _match|
    client.web_client.chat_postMessage(channel: data.channel, text: "Hello")
    end
  end
end
