class Teacher < ActiveRecord::Base
  has_and_belongs_to_many :offerings
  has_one :member, dependent: :destroy, validate: true

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :title, length: {maximum: 6}
  validates :aka, uniqueness: true

end
