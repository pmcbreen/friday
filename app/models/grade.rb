class Grade < ActiveRecord::Base
    belongs_to :divisions
    has_and_belongs_to_many :offerings

	validates :grade_level, presence: true,
		length: { in: 1..2 }, inclusion: {in: %w(K 0 1 2 3 4 5 6 7 8 9 10 11 12)}
end
