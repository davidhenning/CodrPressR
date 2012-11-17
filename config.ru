$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)

require 'rubygems'
require 'bundler'
Bundler.require

require 'codrpress'
run Codrpress.punch_it!