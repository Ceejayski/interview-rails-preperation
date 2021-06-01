class Post < ApplicationRecord
  validates :name, presence: true
  validates :body, presence: true

  validates_presence_of :name, :body
end
