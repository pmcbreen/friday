class AddDivisionToGrade < ActiveRecord::Migration
  def change
    add_column :grades, :division_id, :integer
  end
end
