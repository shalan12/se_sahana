module SessionsHelper
	def log_in(user)
    	session[:current_user] = user
  	end

  	def log_out
    	session.delete(:current_user)
  	end

  	def current_user
  		session[:current_user]
  	end
end
