class CreateTagTopic < ActiveRecord::Migration
  def change
    create_table :tag_topics do |t|
      t.string :topic
      t.integer :tagging_id

      t.timestamps
    end
  end
end
