require 'date'
class EmergenciesController < ApplicationController

	def index
		@emergencies = Emergency.all()
		render :json => @emergencies
	end
	def new
		@current_time = Time.now.strftime("%d/%m/%Y %H:%M")
		location
	end

	def create
		@emergency = Emergency.create!(params[:emergency])
		flash[:info] = 'New Emergency added.'
		redirect_to home_path
	end

	def show
		id = params[:id]
		@emergency = Emergency.find(id)
		@user = session[:current_user];
		#redirect_to emergency_path(@emergency)
	end

	def pledge
		@emergency = Emergency.find(params[:id]);
		@user = session[:current_user];
	end

end