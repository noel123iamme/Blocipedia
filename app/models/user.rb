class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis

  after_initialize :default_role

  def Admin?
  	role == 'admin'
  end

  def Premium?
  	role == 'premium'
  end

  private

  def default_role
  	self.role = 'standard'
  end
end
