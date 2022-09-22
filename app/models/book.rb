class Book < ApplicationRecord
  has_many :copies, :dependent => :delete_all

  validates :Title, presence: true
  validates :Author, presence: true
  validates :ISBN, presence: true
end
