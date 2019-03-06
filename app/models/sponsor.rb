class Sponsor < ApplicationRecord
  belongs_to :image

  def self.only_visible
    Sponsor.where(visible: true)
  end

  acts_as_list
end
