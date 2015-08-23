class AddParentToMembers < ActiveRecord::Migration
  def change
    add_column :members, :parent_id, :integer
  end
end
