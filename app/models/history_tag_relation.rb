class HistoryTagRelation < ApplicationRecord
    belongs_to :history
    belongs_to :tag
end
