class PledgeController < ApplicationController
	def create
		h = params[:donation];
		@emergency = Emergency.find(h[:emergency_id]);
		@user = User.find(h[:user_id]);
		Donation.create!({:user=>@user,:emergency=>@emergency,:amount_donated=>h[:amount_donated]});
		flash[:notice] = "Amount PKR #{h[:amount_donated]} pledged to emergency #{h[:emergency_id]}"
		redirect_to home_path
	end

	def new
		@emergency = Emergency.find(params[:id]);
		@user = session[:current_user];
		render 'new_pledge'
	end
end