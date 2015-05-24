class Emergency < ActiveRecord::Base
  attr_accessible :amount_needed, :emergency_type, :lat, :long, :start_time, :end_time
  has_many :donations
  has_many :users, through: :donations
  after_initialize :init

    def init
      self.end_time ||= 2020-10-10
    end
end