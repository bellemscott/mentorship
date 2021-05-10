class Dropmessages < ActiveRecord::Migration[6.1]
  def change
    drop_table :messages
    drop_table :channel_users
    drop_table :channels
  end
end
