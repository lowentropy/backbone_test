class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :text
      t.integer :position

      t.timestamps
    end
  end
end
