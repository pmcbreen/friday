class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :firstname
      t.string :lastname
      t.string :title
      t.string :aka

      t.timestamps null: false
    end
  end
end
