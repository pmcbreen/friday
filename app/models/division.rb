class Division < ActiveRecord::Base
  has_and_belongs_to_many :offerings
  has_many :grades

	validates :div_number, presence: true,
		length: { maximum: 1 }, inclusion: {in: %w(K 1 2 3 4)}
end
