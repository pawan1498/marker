class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_tagger
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :links

  scope :active, -> {where(active: true)}


  def deactivate_account!
    self.update(active: false)
  end

  def active_account!
    self.update(active: true)

  end

end
