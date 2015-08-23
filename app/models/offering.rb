class Offering < ActiveRecord::Base
  has_and_belongs_to_many :teachers
  has_and_belongs_to_many :divisions
  has_and_belongs_to_many :grades
  
  validates :title, presence: true
  validates :short_desc, presence: true
  validates :long_desc, presence: true
  
  def html_long_desc
    RDiscount.new(self.long_desc, :smart).to_html.html_safe
  end

end
