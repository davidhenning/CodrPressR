module Codrpress
    class Post
        include Mongoid::Document
        store_in collection: "posts"

        # basic data
        field :published_at, :type => DateTime
        field :title, :type => String
        field :body,  :type => String
        field :body_html, :type => String
        field :slugs, :type => Array, :default => []
        field :tags, :type => Array, :default => []
        field :summary, :type => String
        field :link, :type => String
        field :read_more, :type => String
        field :status, :type => String, :default => "draft"
        field :disqus, :type => Boolean, :default => false

        scope :published, where(:status => :published)
        scope :posts, where(:published_at.ne => nil)
        scope :for_year, lambda { |year| d = Date.new(year) ; where(:published_at => (d.beginning_of_year)..(d.end_of_year)) }
        scope :for_month, lambda { |year, month| d = Date.new(year, month) ; where(:published_at => (d.beginning_of_month)..(d.end_of_month)) }
        scope :for_day, lambda { |year, month, day| d = Date.new(year, month, day) ; where(:published_at => (d.beginning_of_day)..(d.end_of_day)) }
        scope :latest, lambda { published.posts.desc(:published_at) }

        before_validation :set_defaults

        def year
            published_at.year
        end

        def month
            published_at.month
        end

        def day
            published_at.day
        end

        def slug
            slugs.try(:last)
        end

        def url
            "/#{sprintf '%04d', year}/#{sprintf '%02d', month}/#{sprintf '%02d', day}/#{slug}/"
        end
    end
end