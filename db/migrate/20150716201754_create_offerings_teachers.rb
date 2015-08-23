class CreateOfferingsTeachers < ActiveRecord::Migration
  def change
    create_table :offerings_teachers, id: false do |t|
      t.belongs_to :teacher, index: true
      t.belongs_to :offering, index: true
    end
  end
end
