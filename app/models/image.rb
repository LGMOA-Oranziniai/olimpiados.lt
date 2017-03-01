class Image < ApplicationRecord
  has_attached_file :file, styles: {thumb: "100x100#", original: "1024x1024>"}, :use_timestamp => false

  validates_uniqueness_of :file_file_name
  validates_attachment_presence :file
  validates_attachment_content_type :file, content_type: /\Aimage/
  validates_attachment_file_name :file, matches: [/png\z/, /jpe?g\z/]

  validates_presence_of :name
  validates_uniqueness_of :name

  before_validation(on: :create) do
    self.name = self.file_file_name.rpartition('.').first if self.name.empty? and self.file_file_name
  end
end
