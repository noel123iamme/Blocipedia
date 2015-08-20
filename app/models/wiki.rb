class Wiki < ActiveRecord::Base
  belongs_to :user

  has_many :collaborators, dependent: :destroy
  has_many :users, through: :collaborators

  scope :publicly_viewable, -> { where( private: false ) }
  scope :privately_viewable, -> { where( private: true ) }
  scope :visible_to, -> ( user ) { user && (user.admin? || user.premium?) ? all : publicly_viewable }

  def public?
  	self.private == false
  end

  def private?
  	self.private == true
  end
end
