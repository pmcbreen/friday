class CreateDivisions < ActiveRecord::Migration
  def change
    create_table :divisions do |t|
      t.integer :div_number

      t.timestamps null: false
    end
  end
end
