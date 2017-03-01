class Category < ApplicationRecord
  has_many :articles

  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates_presence_of :name, :slug
  validates_uniqueness_of :slug


  before_validation(on: :create) do
    self.slug = self.name.parameterize if self.slug.empty?
  end
end
