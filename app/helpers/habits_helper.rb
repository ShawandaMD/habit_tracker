module HabitsHelper
  def user_habits
    #habits=Habit.all
  Habit.where("user_id = ?", current_user.id)
  end
end
