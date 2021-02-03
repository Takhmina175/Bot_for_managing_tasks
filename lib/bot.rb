# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
require 'telegram/bot'
require_relative 'programmers_quotes'
require_relative 'programmers_jokes'

# lib/Description of Jokes class
class Bot
  token = '1692098067:AAFu4RgK5nzEysDpumc6Ch8ruDSRp90JOR0'

  Telegram::Bot::Client.run(token) do |bot|
    bot.listen do |message|
      case message.text
      when '/start'
        bot.api.send_message(chat_id: message.chat.id,
                             text: "Hello #{message.from.first_name},\n Welcome to Mina's Telegram-Bot")
        bot.api.send_message(chat_id: message.chat.id,
                             text: 'Please select one of command to runthe program: /quotes, /jokes, or /sarcasm')
      when '/quotes'
        quotes = Quotes.new
        bot.api.send_message(chat_id: message.chat.id,
                             text: "#{quotes.random_quotes}\n Select more /quotes")
        bot.api.send_message(chat_id: message.chat.id,
                             text: 'You may choose other options like 👉 /jokes 😅 or /stop 🛑')
      when '/jokes'
        jokes = Jokes.new
        bot.api.send_photo(chat_id: message.chat.id, photo: jokes.random_jokes)
        bot.api.send_message(chat_id: message.chat.id,
                             text: 'Select more /jokes')
        bot.api.send_message(chat_id: message.chat.id,
                             text: 'You may choose other options like 👉 /quotes 👩‍💻 or /stop 🛑')
      when '/stop'
        bot.api.send_message(chat_id: message.chat.id,
                             text: "Bye, #{message.from.first_name} I Hope You Enjoy Your Day Quotes And Jokes")
      else
        bot.api.send_message(chat_id: message.chat.id,
                             text: 'Please enter /start /stop /programers_quotes /programers_jokes to run the program')
      end
    end
  end
end
# rubocop: enable Metrics/BlockLength
