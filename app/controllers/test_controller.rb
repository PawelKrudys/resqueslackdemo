class TestController < ApplicationController

class Foo
	@queue = "cokolwiek"
	def self.perform(args)
		puts args
		puts "bangla"
		raise "błąd"
	end
end 

def test
Resque.enqueue(Foo, "Pawel")
render plain: "Testowy string"
end

end 

