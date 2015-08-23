class ChangeMemberFormat < ActiveRecord::Migration
  def change
    remove_column :members, :member_type, :string
    add_column :members, :student_id, :integer
    add_column :members, :teacher_id, :integer
  end
end
