class Link < ApplicationRecord

  def self.only_visible
    Link.where(visible: true)
  end
end
