module Codrpress
    module Helper
        class Pagination
            def self.get_pagination(total, current_page)
                page_count = (total / 10.0).ceil()
                pages = {:prevPageUrl => nil, :nextPageUrl => nil}

                if page_count > 0
                    if current_page > 1
                        pages[:prevPageUrl] = "/#{(current_page - 1)}"
                    end

                    if current_page < page_count
                        pages[:nextPageUrl] = "/#{(current_page + 1)}"
                    end
                end

                pages
            end
        end
    end
end
