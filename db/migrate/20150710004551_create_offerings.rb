class CreateOfferings < ActiveRecord::Migration
  def change
    create_table :offerings do |t|
      t.string :title
      t.text :short_desc
      t.text :long_desc
      t.string :div_num
      t.references :teacher

      t.timestamps null: false
    end
  end
end
