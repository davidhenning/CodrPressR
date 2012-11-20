require 'sinatra/json'

require 'codrpress/actions/weblog'
require 'codrpress/actions/tags'
require 'codrpress/actions/rest'

module Codrpress
    class App < Sinatra::Base
        helpers Sinatra::JSON
        set :public_folder, File.expand_path('../../public/', __FILE__)

        include Codrpress::Actions::Weblog
        include Codrpress::Actions::Tags
        include Codrpress::Actions::Rest
    end
end