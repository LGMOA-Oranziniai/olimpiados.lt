class Article < ApplicationRecord
  belongs_to :category

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates_presence_of :title, :slug
  validates_uniqueness_of :slug

  default_scope { order(created_at: :desc) }

  before_validation(on: :create) do
    self.slug = self.title if self.slug.empty?
  end

  def self.only_visible
    Article.where(visible: true)
  end
end
