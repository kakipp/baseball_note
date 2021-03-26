class HistoriesTag

    include ActiveModel::Model
    attr_accessor :title, :text, :category_id, :name, :user_id
  
    with_options presence: true do
      validates :title
      validates :text
      validates :category_id, numericality: { other_than: 1 }
      validates :name
   end
  
    def save
      history = History.create(title: title, text: text, category_id: category_id,user_id: user_id)
      tag = Tag.where(name: name).first_or_initialize
      tag.save
  
      HistoryTagRelation.create(history_id: history.id, tag_id: tag.id)
    end
  
  end