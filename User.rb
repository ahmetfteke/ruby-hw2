require "observer"

class User
	include Observable

	attr_reader :user_name

	def initialize(user_name)
		@user_name = user_name 
	end
	def converse
    	print @user_name + ": "
		answer = gets().chomp()
		changed                 # notify observers
		notify_observers(answer) # with answer
  	end
end