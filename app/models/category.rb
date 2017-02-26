class Category < ApplicationRecord
  has_many :articles

  def to_param
    self.alias
  end
end
