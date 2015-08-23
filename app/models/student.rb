class Student < ActiveRecord::Base
    has_one :member, dependent: :destroy, validate: true
    belongs_to :parent
    
	validates :first_name, presence: true
	validates :last_name, presence: true
end
