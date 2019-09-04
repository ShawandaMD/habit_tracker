module HabitsHelper
  def user_habits
  Habit.where("user_id = ?", current_user.id)
  end


end
