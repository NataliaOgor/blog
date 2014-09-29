class Article < ActiveRecord::Base
  validates_presence_of :title, :message => "Please, give your article a name!"
  validates_presence_of :body, :message => "You should write something to post!"

  has_many :comments
  belongs_to :user
  has_and_belongs_to_many :categories
end
