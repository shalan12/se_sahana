require 'date'
class EmergenciesController < ApplicationController

	def index
		sort = params[:sort_by]
		puts sort
		if (sort == 'Amount needed')
			flash[:notice] = 'Areas coded by amount needed'
		elsif (sort == 'Number of Emergencies')
			flash[:notice] = 'Areas coded by number of emergencies'
		end
		redirect_to home_path
	end
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
		id = params[:id]
		@emergency = Emergency.find(id)
		@user = session[:current_user];
		

		#redirect_to emergency_path(@emergency)
	end

end