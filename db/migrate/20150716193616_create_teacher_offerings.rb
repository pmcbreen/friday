class CreateTeacherOfferings < ActiveRecord::Migration
  def change
    create_table :teacher_offerings  do |t|
      t.integer :teacher_id
      t.integer :offering_id
    end
    
    add_index :teacher_offerings, :teacher_id
    add_index :teacher_offerings, :offering_id
  end
end
