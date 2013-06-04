class AddLastSyncedToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :last_synced, :datetime
  end
end
