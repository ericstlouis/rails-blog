class AddUserToBlogposts < ActiveRecord::Migration[7.1]
  def change
    add_reference :blogposts, :user, null: false, foreign_key: true
  end
end
