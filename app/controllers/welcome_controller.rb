class WelcomeController < ApplicationController
  def index
		@time = Time.now
		@ps = `ps aus`.to_s
		p @ps
		p "000000000000000000"
		p @ps.class

  end

	
end
