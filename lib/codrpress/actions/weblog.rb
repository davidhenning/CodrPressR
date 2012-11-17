module Codrpress
    module Actions
        module Weblog
            extend ActiveSupport::Concern

            included do
                get "/" do
                    @posts = Post.latest.limit(10)
                    slim :index
                end
            end
        end
    end
end