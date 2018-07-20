class RemoveTestFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :test, foreign_key: true
  end
end
