require 'codrpress/helper/pagination'

module Codrpress
    module Actions
        module Weblog
            extend ActiveSupport::Concern

            included do
                get "/" do
                    @posts = Post.latest.limit(10)
                    @page = 1
                    set_pagination

                    slim :index
                end

                get '/:year/:month/:day/:slug/?' do |year, month, day, slug|
                    @posts = Post.
                        for_day(year.to_i, month.to_i, day.to_i).
                        where(:slugs => slug).limit(1)

                    puts @posts

                    slim :index
                end

                get %r{/([\d]+)} do |page|
                    page = page.to_i
                    offset = (page - 1) * 10
                    @posts = Post.latest.skip(offset).limit(10)
                    @page = page
                    set_pagination

                    slim :index
                end
            end

            def set_pagination
                total = Post.latest.count
                @pagination = Codrpress::Helper::Pagination.get_pagination(total, @page)
            end
        end
    end
end