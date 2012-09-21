class ChangeDataTypeForTableColumn < ActiveRecord::Migration
  def up
    change_table :notes do |t|  
      t.change :message, :text
    end
  end

  def down
  end
end
