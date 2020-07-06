require 'slack-ruby-bot'
require_relative '../lib/weather.rb'
require_relative '../lib/say_hi.rb'
require_relative '../lib/quotes.rb'

class Bot < SlackRubyBot::Bot
    help do
        title 'Rida Bot'
        desc 'this bot is about seaching for some stuff online'

        command :get_weather do
            title 'get the weather'
            desc 'return the weather'
            long_desc 'return weather for any city you want'
        end
        command :say_hi do
            title 'say hi'
            desc 'return the hello word'
        end
    end
end

