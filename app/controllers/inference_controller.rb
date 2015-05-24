class InferenceController < ApplicationController

  def donors
    @donors = User.getUsersByType('donor')
    render 'donors'
  end

  def donor_emergencies
   @emergencies = User.where('id = ?',params[:id]).first.emergencies
   render 'emergenices'
  end

  def emergency_donors
    @donors = Emergency.where('id = ?',params[:id]).first.users
    render 'donors'
  end

end