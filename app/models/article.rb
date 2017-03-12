class Article < ApplicationRecord
  belongs_to :category
  before_save :normalize_line_endings

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates_presence_of :title, :slug
  validates_uniqueness_of :slug

  default_scope { order(created_at: :desc) }

  before_validation(on: :create) do
    self.slug = self.title.parameterize if self.slug.empty?
  end

  def intro_text
    content.split("\n\n", 2)[0]
  end

  def only_intro
    content.split("\n\n").length == 1
  end

  def self.only_visible
    Article.where(visible: true)
  end

  protected

  def normalize_line_endings
    self.content = self.content.gsub /\r\n?/, "\n"
  end
end
