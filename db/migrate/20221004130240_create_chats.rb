class CreateChats < ActiveRecord::Migration[6.1]
  def change
    create_table :chats do |t|
      t.integer :sender_id, index: true
      t.integer :receiver_id, index: true

      t.timestamps
    end
  end
end
