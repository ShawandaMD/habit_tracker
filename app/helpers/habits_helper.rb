module HabitsHelper
  def user_habits
    #habits=Habit.all
  Habit.where("user_id = ?", @user.id)
  end
end
