class CreateFlashCards < ActiveRecord::Migration
  def change
    create_table :flash_cards do |t|
      t.string  :stimulus,  null: false
      t.string  :response,  null: false
      t.integer :set_id,    null: false

      t.timestamps          null: false
    end

    add_index :flash_cards, :set_id
  end
end
