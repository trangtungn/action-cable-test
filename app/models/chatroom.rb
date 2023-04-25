class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages

  validates :topic, presence: true
  validates :topic, uniqueness: { case_sensitive: true }

  before_validation :sanitize, :slugify

  def to_param
    slug
  end

  def slugify
    self.slug = topic.downcase.gsub(' ', '-')
  end

  def sanitize
    self.topic = topic.strip
  end
end
