class User < ActiveRecord::Base
  attr_accessible :username, :password, :user_type #type can be either fieldworker,donor,ngo-worker
  has_many :donations
  has_many :emergencies, through: :donations

  def authenticate(pass)
  	password == pass
  end

  def getUsersByType(type)
  	User.find(:all).where('user_type = ?', type)
  end
end