class AddRateTomemoComments < ActiveRecord::Migration[5.2]
  def change
    add_column :memo_comments, :rates, :float, default: 0
  end
end
