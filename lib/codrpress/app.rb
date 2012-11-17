require 'codrpress/actions/weblog'

module Codrpress
    class App < Sinatra::Base
        set :public_folder, File.expand_path('../../public/', __FILE__)

        include Codrpress::Actions::Weblog
    end
end