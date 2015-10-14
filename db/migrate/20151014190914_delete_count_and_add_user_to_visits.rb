class DeleteCountAndAddUserToVisits < ActiveRecord::Migration
  def up
    remove_column :visits, :count
    add_column :visits, :user_id, :integer
  end
  def down
    remove_column :visits, :user_id
    add_column :visits, :count, :integer
  end
end
