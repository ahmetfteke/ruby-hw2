require_relative 'Response'

class MatchStrategy < Response
	def response(user_answer, responses)
		possible_answers = responses[user_answer].split(";") # get possible responses from dictionary
		possible_answers_used_before = []
		possible_answers.each do |p_a|
			possible_answers_used_before << responses[p_a] # put each answer how many times used
		end
		index_of_least = 0 # index of element to select least used
		(0..possible_answers.length-1).each do |i|
			if possible_answers_used_before[i] < possible_answers_used_before[index_of_least]
				index_of_least = i
			end
		end
		possible_answers[index_of_least] # select randomly from possible answers
	end
end