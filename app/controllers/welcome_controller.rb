class WelcomeController < ApplicationController
  before_filter :teacher_logged_in?, :only => [:teacher]

  def index
    @member ||= Member.new
  end
  def student
  end
  def teacher
    @teacher = logged_in_teacher
  end
  def parent
  end
  def admin
  end
end
