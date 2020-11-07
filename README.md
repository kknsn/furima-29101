## users テーブル

|Column             |Type    |Options                   |
|-------------------|--------|--------------------------|
|nickname           |string  |null: false               |
|email              |string  |null: false, unique: true |
|encrypted_password |string  |null: false               |
|first_name         |string  |null: false               |
|family_name        |string  |null: false               |
|first_kana         |string  |null: false               |
|family_kana        |string  |null: false               |
|birthday           |date    |null: false               |

### Association
- has_many :items
- has_many :purchase_records

## items テーブル

|Column          |Type       |Options                        |
|----------------|-----------|-------------------------------|
|name            |string     |null: false                    |
|description     |text       |null: false                    |
|category_id     |integer    |null: false                    |
|state_id        |integer    |null: false                    |
|delivery_fee_id |integer    |null: false                    |
|area_id         |integer    |null: false                    |
|days_id         |integer    |null: false                    |
|price           |integer    |null: false                    |
|user            |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase_record

## purchase_records テーブル

|Column |Type       |Options                        |
|-------|-----------|-------------------------------|
|user   |references |null: false, foreign_key: true |
|item   |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

##  addresses テーブル

|Column          |Type       |Options                        |
|----------------|-----------|-------------------------------|
|postal_code     |string     |null: false                    |
|prefecture_id   |integer    |null: false                    |
|local           |string     |null: false                    |
|house_num       |string     |null: false                    |
|building_name   |string     |                               |
|tel_num         |string     |null: false                    |
|purchase_record |references |null: false, foreign_key: true |

### Association
- belongs_to :purchase_record