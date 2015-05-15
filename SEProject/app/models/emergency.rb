class Emergency < ActiveRecord::Base
  attr_accessible :amount_needed, :emergency_type, :lat, :long, :start_time, :end_time
  has_many :donations
  has_many :users, through: :donations
end