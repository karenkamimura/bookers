class User < ApplicationRecord
	validates :username,uniqueness: true
  validates :username, length: { in: 2..20 }
  #validates :introduction, length: { in: 2..20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    def email_required?
    	false
    end
    def email_changed?
    	false
    end
    has_many :books
    attachment :profile_image
end
