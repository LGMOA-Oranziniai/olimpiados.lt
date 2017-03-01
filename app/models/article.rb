class Article < ApplicationRecord
  belongs_to :category

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]

  validates_presence_of :title, :slug
  validates_uniqueness_of :slug


  before_validation(on: :create) do
    self.slug = self.title if self.slug.empty?
  end
end
