class AddCommentToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :comment, :string
  end
end
