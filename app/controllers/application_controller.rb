class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

 def location
  if params[:location].blank?
    if Rails.env.test? || Rails.env.development?
      @location ||= Geocoder.search(ENV['RAILS_TEST_IP_ADDRESS']).first
      @location ||= Geocoder.search('2.3.4.5').first
    else
      @location ||= request.location
    end
  else
    params[:location].each {|l| l = l.to_i } if params[:location].is_a? Array
    @location ||= Geocoder.search(params[:location]).first
    @location
  end
end

end
