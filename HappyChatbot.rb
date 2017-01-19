require_relative 'Chatbot'

class HappyChatbot < Chatbot
	def initialize
		@bot_name = "SpongeBob    "
	end
	#reads text file and holds on on hash
	#splits eeach line to key, value structure
	#if line is empty continues
	def readFile
		@responses = Hash.new
		text=File.open('chatter_happy.txt').read
		text.gsub!(/\r\n?/, "\n")
		text.each_line do |line|
			key = line.split(":")[0]
			value = line.split(":")[1]
			next if key.nil? or value.nil?
			@responses[key] = value
			value.split(";").each do |v|
				@responses[v] = 0 # shows how many times used
			end
		end
	end
	def sayHi
		puts @bot_name + ": Hey. It's a lovely day, do you need help my friend?"
	end
	
	def sayBye
		puts @bot_name + ": Bye for now my friend."
	end
end