class User < ActiveRecord::Base
  attr_accessor :password

  validates_uniqueness_of :email
  validates_length_of :email, :within => 5..50
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/

  validates_confirmation_of :password
  validates_length_of :password, :within => 4..20
  #validates_presence_of :password, :if => :password_required?

  has_many :articles, -> {order("published_at DESC, title ASC")}, :dependent => :nullify
  has_many :replies, :through => :articles, :source => :comments

end
