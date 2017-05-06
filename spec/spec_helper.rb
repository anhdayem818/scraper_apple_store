$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require 'bundler/setup'
Bundler.setup

require 'mechanize' # and any other gems you need
require "scraper_app_store"

RSpec.configure do |config|
  # some (optional) config here
end