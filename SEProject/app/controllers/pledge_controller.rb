def create
	@emergency = Emergency.find(params[:emergency_id]);
	@user = User.find(params[:user_id]);
	Donation.create!({:user=>@user,:emergency=>@emergency,:amount_donated=>params[:amount_donated]);
	flash[:notice] = 'New Pledge Submitted.'
	redirect_to home_path
end

def new
	@emergency = Emergency.find(params[:id]);
	@user = session[:current_user];
end