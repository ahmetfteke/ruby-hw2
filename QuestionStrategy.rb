require_relative 'Response'

# get's user answer and splits by words.
# ask questioon with last word of user question
class QuestionStrategy < Response
	def response(user_answer, responses)
		words = user_answer.split(" ")
		answer = "Why do you ask me " + words[words.length-1].delete!("?") + "?"
	end
end