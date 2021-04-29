class AddLastReadAtToChannelUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :channel_users, :last_read_at, :datetime
  end
end
