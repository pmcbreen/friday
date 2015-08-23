class ChangeDivisionToString < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :divisions do |t|
        dir.up   { t.change :div_number, :string }
        dir.down { t.change :div_number, :integer }
      end
    end
  end
end
