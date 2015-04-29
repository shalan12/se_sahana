class User < ActiveRecord::Base
  attr_accessible :username, :password, :type #type can be either fieldworker,donor,ngo-worker
  has_many :donations
  has_many :emergencies, through: :donations

  def authenticate(pass)
  	password == pass
  end
end