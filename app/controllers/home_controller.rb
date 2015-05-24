class HomeController < ApplicationController
	def index
		@user = session[:current_user];
	end
	def sort
		sort = params[:sort_by]
		if (sort == 'Amount needed')
			flash[:notice] = 'Areas coded by amount needed'
		elsif (sort == 'Number of Emergencies')
			flash[:notice] = 'Areas coded by number of emergencies'
		end
		redirect_to home_path
	end
end
