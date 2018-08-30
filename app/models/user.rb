class User < ApplicationRecord
	attachment :image
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  validates :name,    length: { in: 2..20 }
  validates :profile,    length: { maximum: 50 }

    has_many :books
    attachment :image

end