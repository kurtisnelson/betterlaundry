class ChangeToUuid < ActiveRecord::Migration
  def up
    enable_extension 'uuid-ossp'
    add_column :machines, :uuid, :uuid, default: "uuid_generate_v4()", null: false
    change_table :machines do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute "ALTER TABLE machines ADD PRIMARY KEY (id);"

    add_column :rooms, :uuid, :uuid, default: "uuid_generate_v4()", null: false
    change_table :rooms do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute "ALTER TABLE rooms ADD PRIMARY KEY (id);"
  end
end
