class AddStatusToTasks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tasks, :status, null: false, foreign_key: true
  end
end
