class CreateSendingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :sending_addresses do |t|

      t.timestamps
    end
  end
end
