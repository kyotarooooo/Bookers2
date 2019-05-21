class User < ApplicationRecord

  attachment :profile_image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username,uniqueness: true
  validates :username,length: { in: 2..20 }
  validates :introduction,length: { maximum: 50 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_many :books, dependent: :destroy

  def email_required?
  	false
  end
  def email_changed?
  	false
  end
end
