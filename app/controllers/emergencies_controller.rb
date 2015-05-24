require 'date'
class EmergenciesController < ApplicationController

	def index
		@emergencies = Emergency.all();
		render :json => @emergencies;
	end

	def new
		@current_time = Time.now.strftime("%d/%m/%Y %H:%M")
		env['HTTP_X_REAL_IP'] = '1.2.3.4' if Rails.env.development?
		@location = request.location
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

end