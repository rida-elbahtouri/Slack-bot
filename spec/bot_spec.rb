require_relative '../bin/bot.rb'
require_relative './spec_helper.rb'

RSpec.describe 'Ridabot' do
  it 'Hints help', :vcr do
    expect(
      message: "#{SlackRubyBot.config.user} Help"
    ).to respond_with_slack_message
  end
  it 'Says hi', :vcr do
    expect(
      message: "#{SlackRubyBot.config.user} hi"
    ).to respond_with_slack_message('Hi <@user>!')
  end

  it 'Ignores unknown commands' do
    expect(message: "#{SlackRubyBot.config.user} unknown").to respond_with_slack_message('Sorry <@user>,'\
    " I don't understand that command!")
  end
  it 'return an msg when ask for random quote', :vcr do
    expect(
      message: "#{SlackRubyBot.config.user} can you give me a random quote?"
    ).to respond_with_slack_message
  end
end
