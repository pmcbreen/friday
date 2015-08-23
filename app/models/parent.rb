class Parent < ActiveRecord::Base
  has_many :students
  has_one :member, dependent: :destroy, validate: true

  validates :first_name, presence: true,
                    length: { maximum: 25}  
  validates :last_name, presence: true,
                    length: { maximum: 25 }
end