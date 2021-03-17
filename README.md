
















# テーブル設計

## users テーブル

| Column           | Type    | Options                   |
| ---------------- | ------- | ------------------------- |
| name             | string  | null: false               |
| email            | string  | null: false, unique: true |
| password         | string  | null: false               |
| position_id      | integer | null: false               |
| affiliation_id   | integer | null: false               |
| affiliation_team | string  |                           |
| introduction     | text    | null: false               |

### Association

- has_many :histories


## histories テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| text        | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :tags, through: history_tag_relations



## tags テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| name    | string     | null:false, uniqueness: true   |

### Association

- has_many :histories, through: history_tag_relations

## history_tag_relations テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| history | references | null: false, foreign_key: true |
| tag     | references | null: false, foreign_key: true |

### Association

- belongs_to :history
- belongs_to :tag
