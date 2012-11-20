module Codrpress
    module Actions
        module Rest
            extend ActiveSupport::Concern

            included do
                get "/rest/posts" do
                    posts = Post.latest.limit(10)
                    response = {
                        :status => 200,
                        :response => {
                            :total => Post.latest.count,
                            :found => posts.count,
                            :documents => get_documents(posts)
                        }
                    }

                    json response
                end
            end

            def get_documents(posts)
                documents = []
                for post in posts do
                    document = {}

                    for attribute in post.attributes do
                        value = attribute.last
                        document.store(attribute.first, ((value.kind_of?(Array) or value.kind_of?(Hash)) ? value : value.to_s))
                    end

                    documents.push(document)
                end

                documents
            end
        end
    end
end
