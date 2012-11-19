require 'codrpress/actions/weblog'
require 'codrpress/actions/tags'

module Codrpress
    class App < Sinatra::Base
        set :public_folder, File.expand_path('../../public/', __FILE__)

        include Codrpress::Actions::Weblog
        include Codrpress::Actions::Tags
    end
end