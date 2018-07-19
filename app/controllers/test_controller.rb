#require 'http'
require 'json'


TOKEN = 'xoxb-346632953504-396440310195-BzvJty0BeviBkeBIrqfljkBt'

class TestController < ApplicationController

class Foo
	@queue = "cokolwiek"
	def self.perform(args)
		puts args
		if args == "Fail" 
				puts "Job failed"
				HTTP.post("https://slack.com/api/chat.postMessage", params:{
				token: TOKEN,
				channel: '#test',
				text: "*Job failed with arguments:* \n #{args}",
				as_user: true
				})
				raise "Request not available"
			else 
				puts "Job succedeed"
		end
	end
end 

def pierwszy
Resque.enqueue(Foo, "Fail")
#Resque.enqueue(Foo, "Jest OK")
render plain: "Testowy string"
end

def drugi
#Resque.enqueue(Foo, "Fail")
Resque.enqueue(Foo, "Jest OK")
render plain: "Inny string"
end

end 





