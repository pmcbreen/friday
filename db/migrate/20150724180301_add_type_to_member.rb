class AddTypeToMember < ActiveRecord::Migration
  def change
    add_column :members, :member_type, :string
  end
end
