class Tag < ApplicationRecord
    has_many :history_tag_relations
    has_many :histories, through: :history_tag_relations

    validates :name, uniqueness: true
end
