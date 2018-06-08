class ChangeColumnToTweets < ActiveRecord::Migration[5.2]
  def up
    change_column :tweets, :content, :text, null: false
  end

  def down
    change_column :tweets, :content
  end
end
