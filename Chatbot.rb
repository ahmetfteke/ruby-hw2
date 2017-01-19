require "observer"
require_relative 'MatchStrategy'
require_relative 'QuestionStrategy'
require_relative 'ChangeSubjectStrategy'
require_relative 'EndConversationStrategy'

class Chatbot
	def initialize
		@user
		@conversation_goes = true
	end
	def enterChat(user)
		add(user) # add bot as observer
		readFile # read file abstract method
		sayHi 
	end
	def add(user)
		@user = user
    	@user.add_observer(self)
    end
	def readFile
		raise NoMethodError
	end
	def sayHi
		raise NoMethodError
	end

	def update(answer) 
		@user_answer = answer
    	setStrategy # for each answer update bot answer method
  	end
	def setStrategy
		is_match = false
		@responses.each do |key, value| # for each response dictionary try to match 
			if @user_answer.downcase.include? key.downcase # is user said something on dictionary
				@user_answer = key
				@strategy = MatchStrategy.new
				is_match = true # skip other responde methods
				break
			end
		end
		if not is_match
			if @user_answer.end_with? "?" # if user asks a question
				@strategy = QuestionStrategy.new
			elsif @user_answer.split(" ").length != 1
				@strategy = ChangeSubjectStrategy.new # if user sends input neither question nor just a word
			else
				@strategy = EndConversationStrategy.new # user sends a word
				@user.delete_observer(self) # remove the bot, because conversation is over
				sayBye # say bye
				return
			end
		end
		answer = @strategy.response(@user_answer, @responses) # reponse is strategy method
		if is_match # if it's match increase 1 answer used before value
			@responses[answer] += 1
		end
		puts @bot_name + ": " + answer
	end
	def sayBye
		raise NoMethodError
	end
end