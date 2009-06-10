namespace :feeds do

  task :update => :environment do
    not_updated = []
    blogs = Blog.all
    blogs.each do |blog|
      unless blog.update_feed_data
        not_updated << blog.feed_url
      end
    end
    puts "All #{blogs.count} feeds updated successfully" if not_updated.blank?
  end

end
