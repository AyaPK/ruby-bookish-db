class Book < ApplicationRecord
  has_many :copies, :dependent => :delete_all
  has_one_attached :cover

  validates :Title, presence: true
  validates :Author, presence: true
  validates :ISBN, presence: true
end
