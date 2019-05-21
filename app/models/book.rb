class Book < ApplicationRecord
	validates :body,uniqueness: true
	validates :body,length: { maximum: 200 }

	belongs_to :user


end
