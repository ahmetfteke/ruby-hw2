Ahmet Furkan Teke

Project Structure

Main - main.rb
User - observable subject

Chatbot - observers, template method, contains context for respond strategies
	AngryChatbot - has angry dictionary
	HappyChatbot - has happy dictionary
	DepressedChatbot - has sad dictionary

Response - interface with respon method
	MatchStrategy - match strategy
	QuestionStrategy - question strategy
	ChangeSubjectStrategy - change subject strategy
	EndConversationStrategy - end conversation strategy

How works?
Main creates user and bots.
Each bot enters chat
	On chatbot's template method, they start observing user(add_observer)
	Each bot class implements own way to read file.
When user input
	user class notifies observers with inpute text
	observers get update with input text
	update calls set strategy
	depending on input text, strategy will be decided
	strategy response method will be called
	if conversation is not ended user will be asked again to converse
	otherwise bot will delete itself from observer list(delete_observer)
	and lastly, bot will say bye
