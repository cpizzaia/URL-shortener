class RemoveUniquenessFromVisitsIndex < ActiveRecord::Migration
  def change
    remove_index :visits, :column => :shortened_url_id
    add_index :visits, :shortened_url_id, unique: false
  end
end
