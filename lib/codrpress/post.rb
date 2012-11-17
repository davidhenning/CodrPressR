module Codrpress
    class Post
        include Mongoid::Document
        store_in collection: "posts"

        # basic data
        field :title, :type => String
        field :body,  :type => String
        field :slugs, :type => Array, :default => []

        scope :published, where(:status => :published)
        scope :posts, where(:published_at.ne => nil)
        scope :latest, lambda { published.posts.desc(:published_at) }
    end
end