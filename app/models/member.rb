require 'digest/sha1'

class Member < ActiveRecord::Base
  attr_accessor :password
  attr_accessor :password_confirmation
  belongs_to :teacher
  belongs_to :student
  belongs_to :parent
  
  validates_presence_of :name
  validates_length_of :name, :within => 2..40
  validates_uniqueness_of :name, :case_sensitive => false

  validates_presence_of :password, :if => :password_required?
  validates_presence_of :password_confirmation, :if => :password_required?
  validates_length_of :password, :within => 2..40, :if => :password_required?
  validates_confirmation_of :password, :if => :password_required?
  
  before_save :encrypt_password
  
  def self.identify(name, password)
    u = find_by_name(name)
    u && u.identified?(password) ? u : nil
  end
  
  def identified?(password)
    hashed_password == encrypt(password)
  end
  
  def self.encrypt(password, salt)
    Digest::SHA1.hexdigest("#{salt}#{password}")
  end
  
  def encrypt(password)
    self.class.encrypt(password, salt)
  end
  
  def admin?
    self.teacher_id.nil? && self.parent_id.nil? && self.student_id.nil?
  end
  
  protected
  def encrypt_password
    return if password.blank?
    self.salt = "random#{rand()}" # unique salt per user (overkill for this app)
    self.hashed_password = encrypt(password)
  end
  
  def password_required?
    hashed_password.blank? || !password.blank?
  end
end
