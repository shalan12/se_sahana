class EmergenciesController < ApplicationController

	def new
		@current_time = Time.now
		env['HTTP_X_REAL_IP'] = '1.2.3.4' if Rails.env.development?
		@location = request.location
		puts '#{@location}'
	end

	def create
		@emergency = Emergency.create!(params[:emergency])
		flash[:notice] = 'New Emergency added.'
		#redirect_to emergencies_path
	end

	def show
		#id = params[:id]
		#@emergency = Emergency.find(id)
	end

end