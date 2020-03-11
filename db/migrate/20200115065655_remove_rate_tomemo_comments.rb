class RemoveRateTomemoComments < ActiveRecord::Migration[5.2]
  def change
     remove_column :memo_comments, :rate, :float, null: false, default: 0
  end
end
