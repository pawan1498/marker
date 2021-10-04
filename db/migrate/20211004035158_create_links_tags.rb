class CreateLinksTags < ActiveRecord::Migration[6.1]
  def change
    create_table :links_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
