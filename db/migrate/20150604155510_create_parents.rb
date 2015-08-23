class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :first_name
      t.text :last_name

      t.timestamps null: false
    end
  end
end
