module Codrpress
    module Actions
        module Weblog
            extend ActiveSupport::Concern

            included do
                get "/" do
                    @posts = Post.latest.limit(10)
                    slim :index
                end

                get '/:year/:month/:day/:slug/?' do |year, month, day, slug|
                    @posts = Post.
                        for_day(year.to_i, month.to_i, day.to_i).
                        where(:slugs => slug).limit(1)

                    slim :index
                end
            end
        end
    end
end