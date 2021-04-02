class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :histories
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
         belongs_to :affiliation
         belongs_to :position


         with_options presence: true do
           validates :name
           validates :introduction
           validates :position_id, numericality: { other_than: 1 }
           validates :affiliation_id, numericality: { other_than: 1 }
           validates :image
         end
end
