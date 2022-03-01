require 'rubygems'
require 'bundler'
require_relative '../app.rb'

exec "bundle install"
run Sinatra::Application