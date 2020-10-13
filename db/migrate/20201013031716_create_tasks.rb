class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.date :date
      t.string :priority
      t.belongs_to :person, index: true, null: false, foreign_key: true

      t.timestamps
    end
  end
end
