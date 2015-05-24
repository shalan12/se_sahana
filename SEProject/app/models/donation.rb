class Donation < ActiveRecord::Base
  attr_accessible :user, :emergency, :amount_donated
  belongs_to :user
  belongs_to :emergency
end