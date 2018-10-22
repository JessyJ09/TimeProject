class Subject < ApplicationRecord
	belongs_to :category
	has_many :publications

	scope :hier, -> { where(category_id: 1) }
	scope :aujourdhui, -> { where(category_id: 2)}
	scope :demain, -> { where(category_id: 3)}
end
