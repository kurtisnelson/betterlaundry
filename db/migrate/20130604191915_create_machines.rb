class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.belongs_to :room, index: true
      t.integer :number
      t.integer :remaining
      t.string :status

      t.timestamps
    end
  end
end
