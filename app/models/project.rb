class Project < ActiveRecord::Base
  belongs_to :client
  has_many :photos, :as => :attachable

  named_scope :featured, lambda {|limit| { :order => 'created_at DESC', :limit => limit } }

  def attachments=(files)
    for file in files
      self.photos.build :file => file
    end
  end

  def client_name
    client.name if client
  end

  def client_name=(name)
    self.client = Client.find_or_create_by_name(name)
  end
end
