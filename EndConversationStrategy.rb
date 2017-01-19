require_relative 'Response'

class EndConversationStrategy < Response
	def response(user_answer, responses)
		user_answer # just returns user answer
	end
end