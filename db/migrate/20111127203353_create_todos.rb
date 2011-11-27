class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :body
      t.boolean :isDone

      t.timestamps
    end
  end
end
