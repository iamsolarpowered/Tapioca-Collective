class Blog < ActiveRecord::Base
  acts_as_feed

  belongs_to :user

  def self.recent_entries
    entries = []
    all.each {|b| entries << b.parsed_feed[:entries].first(3) if b.parsed_feed[:entries] }
    entries.flatten.sort_by {|entry| entry[:published_at] }.reverse
  end

  def parsed_feed
    data = YAML.load(feed_data)
    data[:entries].each {|e| e[:username] = user.username.capitalize if user }
    data
  end
end
