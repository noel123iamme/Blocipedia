class Wiki < ActiveRecord::Base
  belongs_to :user

  scope :publicly_viewable, -> { where( private: false ) }
  scope :privately_viewable, -> { where( private: true ) }
  scope :visible_to, -> ( user ) { user && (user.admin? || user.premium?) ? all : publicly_viewable }
end
