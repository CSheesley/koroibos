class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_name
      t.references :sport, foreign_key: true

      t.timestamps
    end
  end
end
