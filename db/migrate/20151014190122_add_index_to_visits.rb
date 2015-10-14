class AddIndexToVisits < ActiveRecord::Migration
  def change
    add_index :visits, :shortened_url_id, unique: true
  end
end
