class History < ApplicationRecord
   belongs_to :user
   has_many :history_tag_relations,dependent: :destroy
   has_many :tags, through: :history_tag_relations
    extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to :category

         
end
