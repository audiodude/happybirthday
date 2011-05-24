require 'rubygems'
require 'bundler/setup'
Bundler.require :default, ENV['RACK_ENV']

Sinatra::Application.default_options.merge!(
  :run => false,
  :env => ENV['RACK_ENV']
)

require 'app'
run Sinatra::Application