class RemoveIdFromTeacherOfferings < ActiveRecord::Migration
  def change
    remove_column :teacher_offerings, :id, :integer
  end
end
