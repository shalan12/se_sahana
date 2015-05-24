require 'date'
class EmergenciesController < ApplicationController

	def new
		@current_time = Time.now.strftime("%d/%m/%Y %H:%M")
		location
	end

	def create
		@emergency = Emergency.create!(params[:emergency])
		flash[:notice] = 'New Emergency added.'
		redirect_to home_path
	end

	def show
		#id = params[:id]
		#@emergency = Emergency.find(id)
	end

	def pledge
		@emergency = Emergency.find(params[:id]);
		@user = session[:current_user];
	end

end