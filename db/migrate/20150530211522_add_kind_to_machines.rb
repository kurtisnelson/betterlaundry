class AddKindToMachines < ActiveRecord::Migration
  def change
    add_column :machines, :kind, :string
  end
end
