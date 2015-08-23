class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :grade_level

      t.timestamps null: false
    end
  end
end
