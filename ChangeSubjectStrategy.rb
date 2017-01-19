require_relative 'Response'

class ChangeSubjectStrategy < Response
	def response(user_answer, responses) 
		possible_answers = responses["change subject"].split(";") # get possible change subject responses
		possible_answers[rand(possible_answers.length)] # select one of them
	end
end