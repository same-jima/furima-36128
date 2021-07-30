class CreateItemTags < ActiveRecord::Migration[6.0]
  def change
    create_table :item_tags do |t|
      t.references :user,       null: false, foregeign_key: true
      t.references :item,       null: false, foregeign_key: true
      t.timestamps
    end
  end
end
