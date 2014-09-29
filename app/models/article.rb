class Article < ActiveRecord::Base
  validates_presence_of :title, :message => "can't be blank"
  validates_presence_of :body, :message => "can't be blank"

  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :comments

  def published?
    published_at.present?
  end
end
