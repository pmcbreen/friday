class CreateDivisionsOfferings < ActiveRecord::Migration
  def change
    create_table :divisions_offerings do |t|
      t.belongs_to :division, index: true
      t.belongs_to :offering, index: true
    end
  end
end
