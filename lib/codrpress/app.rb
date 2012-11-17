require 'codrpress/actions/weblog'

module Codrpress
    class App < Sinatra::Base
        include Codrpress::Actions::Weblog
    end
end