class AddIsDraftToBlogposts < ActiveRecord::Migration[7.1]
  def change
    add_column :blogposts, :is_draft, :boolean
  end
end
