class CreateHistoryTagRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :history_tag_relations do |t|
      t.references :history, foreign_key: true
      t.references :tag, foreign_key: true
      t.timestamps
    end
  end
end
