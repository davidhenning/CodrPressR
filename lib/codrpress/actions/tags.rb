module Codrpress
    module Actions
        module Tags
            extend ActiveSupport::Concern

            included do
                get '/tag/:tag?' do |tag|
                    @posts = Post.where(:tags => tag)

                    slim :index
                end
            end
        end
    end
end