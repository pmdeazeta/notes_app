class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :name
      t.string :message
      t.integer :notebook_id

      t.timestamps
    end
  end
end
