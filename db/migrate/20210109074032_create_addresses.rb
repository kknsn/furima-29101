class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code,   null: false, default: ""
      t.integer    :prefecture_id, null: false
      t.string     :local,         null: false, default: ""
      t.string     :house_num,     null: false, default: ""
      t.string     :building_name, default: ""
      t.string     :tel_num,       null: false, default: ""
      t.timestamps
    end
  end
end
