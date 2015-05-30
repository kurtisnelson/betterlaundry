class AddOutOfServiceToMachines < ActiveRecord::Migration
  def change
    add_column :machines, :out_of_service, :boolean, default: false
  end
end
