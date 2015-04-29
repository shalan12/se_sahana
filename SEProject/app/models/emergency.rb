class Emergency < ActiveRecord::Base
  attr_accessible :amount_needed, :emergency_type, :location, :start_time, :end_time
  has_many :donations
  has_many :users, through: :donations
end