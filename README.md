#テーブル設計

##usersテーブル
|column            |Type   |Options                        |
|------------------|-------|-------------------------------|
|email             |string |null:false,unique:true         |
|encrypted_password|string |null:false                     |
|nickname          |string |null:false                     |
|last_name         |string |null:false                     |
|first_name        |string |null:false                     |
|last_name_kana    |string |null:false                     |
|first_name_kana   |string |null:false                     |
|birthday          |date   |null:false                     |

### association
- has_many :items
- has_many :records

##furimasテーブル
|column            |Type      |Options                     |
|------------------|----------|----------------------------|
|title             |string    |null:false                  |
|content           |text      |null:false                  |
|genre_id          |integer   |null:false                  |
|condition_id      |integer   |null:false                  |
|fee_id            |integer   |null:false                  |
|prefecture_id     |integer   |null:false                  |
|days_num_id       |integer   |null:false                  |
|price             |integer   |null:false                  |
|user              |references|null:false,foreign_key: true|

### association
- belongs_to :user
- has_one    :record

##deliveriesテーブル
|column            |Type      |Options                     |
|------------------|----------|----------------------------|
|post_code         |string    |null:false                  |
|prefecture_id     |integer   |null:false                  |
|city              |string    |null:false                  |
|house             |string    |null:false                  |
|building_number   |string    |                            |
|phone             |string    |null:false                  |
|record            |references|null:false,foreign_key: true|


### association
- belongs_to :record

##recordsテーブル
|column            |Type      |Options                     |
|------------------|----------|----------------------------|
|user              |references|null:false,foreign_key: true|
|item              |references|null:false,foreign_key: true|

### association
- belongs_to :item
- has_one    :delivery
- belongs_to :user