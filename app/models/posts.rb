# Agregates members' feeds for public site.
class Posts
  def self.recent
    blogs = Blog.all
    posts = []
    for blog in blogs
      entries = blog.entries.first(3) if blog.entries
      for entry in entries
        posts << Post.new(blog.user, entry)
      end
    end
    posts.sort_by {|p| p.date_published }.reverse
  end
end

class Post
  attr_accessor :author, :entry, :title, :url, :description, :id, :date_published

  def initialize author, entry
    @author         = author
    @entry          = entry
    @title          = @entry.title
    @url            = @entry.url
    @description    = @entry.description
    @id             = @entry.id
    @date_published = @entry.date_published
  end
end
