class AddUserToHabits < ActiveRecord::Migration[5.2]
  def change
    add_reference :habits, :user, foreign_key: true
  end
end
