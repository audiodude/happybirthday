require 'rubygems'
require 'bundler/setup'
Bundler.require :default, ENV['RACK_ENV'  ]

require 'app'
run Sinatra::Application