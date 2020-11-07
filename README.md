## users テーブル

|Column      |Type   |Options                   |
|------------|-------|--------------------------|
|nickname    |string |null: false               |
|email       |string |null: false, unique: true |
|password    |string |null: false               |
|first_name  |string |null: false               |
|family_name |string |null: false               |
|first_kana  |string |null: false               |
|family_kana |string |null: false               |
|birth_year  |integer|null: false               |
|birth_month |integer|null: false               |
|birthday    |integer|null: false               |

### Association
- has_many :items
- has_many :purchasers

## items テーブル

|Column      |Type       |Options                        |
|------------|-----------|-------------------------------|
|item_image  |string     |null: false                    |
|item_name   |string     |null: false                    |
|description |text       |null: false                    |
|category    |string     |null: false                    |
|state       |string     |null: false                    |
|delivery_fee|string     |null: false                    |
|area        |string     |null: false                    |
|days        |string     |null: false                    |
|price       |integer    |null: false                    |
|user        |references |null: false, foreign_key: true |

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
|postal_code     |integer    |null: false                    |
|prefecture      |string     |null: false                    |
|local           |string     |null: false                    |
|house_num       |string     |null: false                    |
|building_name   |string     |                               |
|tel_num         |integer    |null: false                    |
|purchase_record |references |null: false, foreign_key: true |

### Association
- belongs_to :purchase_record