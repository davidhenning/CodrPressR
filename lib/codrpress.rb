require 'mongoid'

require 'haml'

require 'active_support/concern'

require 'codrpress/app'
require 'codrpress/post'

module Codrpress
    class << self
        def punch_it!
            Mongoid.load!("./config/mongoid.yml", :development)
            App
        end
    end
end