class Book < ApplicationRecord

  validates :title,   length: { maximum: 200 }, presence: true
  validates :body,    length: { maximum: 200 }, presence: true


  belongs_to :user
    
end
