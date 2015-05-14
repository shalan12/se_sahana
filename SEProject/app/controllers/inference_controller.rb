class InferencController < ApplicationController

  def donors
    @donors = User.getUsersByType('donor')
    render 'donors'
  end

  def donor_emergenices
   @emergencies = User.where('id = ?',params[:id]).emergencies
  end

  def emergency_donors
    @donors = Emeregency.where('id = ?',params[:id]).users
    render 'donors'
  end

end