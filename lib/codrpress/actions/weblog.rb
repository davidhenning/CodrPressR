module Codrpress
    module Actions
        module Weblog
            extend ActiveSupport::Concern

            included do
                get "/" do
                    @posts = Post.latest
                    haml :index
                end
            end
        end
    end
end