class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date :occurance

      t.timestamps
    end
  end
end
