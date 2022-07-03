#テーブル設計

##usersテーブル
|column            |Type   |Options                        |
|------------------|-------|-------------------------------|
|email             |string |null:false                     |
|password          |string |null:false                     |
|encrypted_password|string |null:false                     |
|nickname          |string |null:false                     |
|lastname          |string |null:false                     |
|firstname         |string |null:false                     |
|birth_year        |integer|null:false                     |
|birth_month       |integer|null:false                     |
|birth_day         |integer|null:false                     |

##itemsテーブル
|column            |Type      |Options                     |
|------------------|----------|----------------------------|
|title             |string    |null:false                  |
|content           |text      |null:false                  |
|genre             |string    |null:false                  |
|condition         |string    |null:false                  |
|fee               |string    |null:false                  |
|area              |string    |null:false                  |
|days              |string    |null:false                  |
|price             |integer   |null:false                  |
|user              |references|null:false,foreign_key: true|

##item_genresテーブル
|column            |Type      |Options                     |
|------------------|----------|----------------------------|
|item              |references|null:false,foreign_key: true|
|genre             |references|null:false,foreign_key: true|

##genresテーブル
|column            |Type      |Options                     |
|------------------|----------|----------------------------|
|genre             |string    |null:false                  |

##commentsテーブル
|column            |Type      |Options                     |
|------------------|----------|----------------------------|
|content_comment   |text      |null:false                  |
|item              |references|null:false,foreign_key: true|
|user              |references|null:false,foreign_key: true|

##deliverysテーブル
|column            |Type      |Options                     |
|------------------|----------|----------------------------|
|post_code         |string    |null:false                  |
|prefecture        |string    |null:false                  |
|city              |string    |null:false                  |
|house             |string    |null:false                  |
|building_number   |string    |                            |
|phone             |string    |null:false                  |
|user              |references|null:false,foreign_key: true|