class Book < ApplicationRecord
  belongs_to :book
  
  validates :title, presence: "true"
  validates :body, presence: ""
  
end
