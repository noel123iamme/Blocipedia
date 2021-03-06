class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis, dependent: :destroy
  has_many :collaborators, dependent: :destroy

  after_initialize :default_role

  def admin?
    role == 'admin'
  end

  def premium?
    role == 'premium'
  end

  def standard?
    role == 'standard'
  end

  def upgrade_to_premium
    update_attributes(role: 'premium')
  end

  def downgrade_to_standard
    update_attributes(role: 'standard')
  end

  private

  def default_role
    self.role ||= 'standard'
  end
end
