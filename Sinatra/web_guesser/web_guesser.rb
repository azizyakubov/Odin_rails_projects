require 'sinatra'
require 'sinatra/reloader'

@@guess_counter = 6
@@secret_num = rand(101)

def check_guess(guess)
  if !params.include?("guess")
    ["Enter your guess below:", "pink"]
  else
    case guess - @@secret_num
      when 10..100 then ["Way too high! Number of guesses left: #{@@guess_counter-1}", "red"]
      when 1...10 then ["Warm, but a little high. Number of guesses left: #{@@guess_counter-1}", "yellow"]
      when 0
          start
          return ["Good job! You guessed the right number. New Game is starting... ", "green"]
      when -10...0 then ["Warm, but a little too low. Number of guesses left: #{@@guess_counter-1}", "yellow"]
      when -100..-11 then ["Way too low! Number of guesses left: #{@@guess_counter-1}", "red"]
    end
  end
end

def start
  @@secret_num = rand(101)
  @@guess_counter = 6

end



get '/' do

  guess = params["guess"].to_i
  evaluate = check_guess(guess)
  message = evaluate[0]
  background_color = evaluate[1]
  @@guess_counter -= 1

  if @@guess_counter == 0 && guess != @@secret_num
    message = "You lost. Generating a new number...Let's try again"
    background_color = "pink"
    start
  end

  erb :index, :locals => {:background_color => background_color, :number => @@secret_num, :message => message, :guess => guess, :guess_counter => @@guess_counter}

end
