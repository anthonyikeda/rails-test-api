class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :venue
      t.datetime :event_time
      t.string :name
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
