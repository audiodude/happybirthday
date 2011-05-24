require 'rubygems'
require 'bundler/setup'
Bundle.require :default

Sinatra::Application.default_options.merge!(
  :run => false,
  :env => ENV['RACK_ENV']
)

require 'app'
run Sinatra::Application