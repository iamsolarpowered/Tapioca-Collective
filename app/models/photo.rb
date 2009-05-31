class Photo < Attachment
  has_attached_file :file, :styles => {
    :thumbnail => '100x100>',
    :small => '150x150>',
    :large => '800x800>'
  }
end
