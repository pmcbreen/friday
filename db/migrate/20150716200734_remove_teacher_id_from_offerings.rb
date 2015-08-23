class RemoveTeacherIdFromOfferings < ActiveRecord::Migration
  def change
    remove_column :offerings, :teacher_id, :integer
  end
end
