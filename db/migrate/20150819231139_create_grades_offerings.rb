class CreateGradesOfferings < ActiveRecord::Migration
  def change
    create_table :grades_offerings do |t|
      t.belongs_to :grade, index: true
      t.belongs_to :offering, index: true
    end
  end
end
