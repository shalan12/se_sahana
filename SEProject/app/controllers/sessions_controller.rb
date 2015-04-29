class SessionsController < ApplicationController
  def new

  end

  def create
  	logged_in = false
  	user = User.find_by_username(params[:session][:username])
  	if user
  		if user.authenticate(params[:session][:password])
	  		flash.now[:success] = "Logged in :)"
			log_in(user)
			logged_in = true
		else
			flash.now[:danger] = "Wrong password >_<"
		end
  	else
  		flash.now[:danger] = "Sorry I don't know you o.0"
  	end

  	if logged_in
  		redirect_to home_path
  	else
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	render 'new'
  end
end
