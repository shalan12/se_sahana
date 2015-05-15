class Donation < ActiveRecord::Base
  attr_accessible :username, :emId, :amount_donated
  belongs_to :user
  belongs_to :emergency
end