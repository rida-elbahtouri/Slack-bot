# frozen_string_literal: true

require 'slack-ruby-bot'
require_relative '../lib/weather.rb'
require_relative '../lib/say_hi.rb'
require_relative '../lib/quotes.rb'

class Bot < SlackRubyBot::Bot
  help do
    title 'Rida Bot'
    desc 'this bot will welcome you and tell you about the weather\n and also give you some inspirational quotes'

    command :can_you_tell_me_the_weather_in do
      title 'can you tell me the weather in'
      desc 'return the weather'
      long_desc 'return weather for any city you want \n
            all what you need to do is say \n
            can you tell me the weather in the name of the city ?'
    end
    command :can_you_give_me_a_random_quotes? do
      title 'can you give me a random quotes?'
      desc 'return the a random quotes'
      long_desc 'generate a random Quotes for you
            \n just say can you give me a random quotes? \nand it done'
    end
    command :hello_there do
      title 'hello there'
      desc 'welcome the person and give him  a random quote'
    end
  end
end
