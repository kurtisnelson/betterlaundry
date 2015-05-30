class RemoveStatusFromMachine < ActiveRecord::Migration
  def change
    remove_column :machines, :status
  end
end
