class Project < ActiveRecord::Base
  CATEGORIES = ['Web', 'Print', 'Identity']

  belongs_to :client
  has_many :photos, :as => :attachable

  named_scope :featured, :conditions => {:featured => true}
  named_scope :public, :conditions => {:public => true}
                                           
  named_scope :by_category, lambda {|category| {:conditions => {:category => category}} }
  
  named_scope :random, :order => 'random()'

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

  def public_url
    production_url if public
  end
end
