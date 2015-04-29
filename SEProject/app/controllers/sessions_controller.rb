class SessionsController < ApplicationController
  def new

  end

  def create
  	logged_in = false
  	user = User.find_by(username: params[:session][:username])
  	if user
  		if user.authenticate(params[:session][:password])
	  		flash.now[:success] = "Logged in :)"
			SessionHelper.log_in(user)
			logged_in = true
		else
			flash.now[:danger] = "Wrong password >_<"
		end
  	else
  		flash.now[:danger] = "Sorry I don't know you -_-"
  	end

  	if logged_in
  		render 'new'
  	else
  		render 'new'
  	end
  end

  def destroy

  end
end
