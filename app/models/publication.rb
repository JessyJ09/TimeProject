class Publication < ApplicationRecord
  belongs_to :subject
  belongs_to :user
  has_many :commentaires

  
end

