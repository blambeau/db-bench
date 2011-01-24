require 'rubygems'
require 'active_record'
require 'yaml'
require 'logger'
require 'benchmark'

# Connection config
config = YAML::load File.read(File.expand_path('../database.yml', __FILE__))
ActiveRecord::Base.establish_connection(config)

# Model
require File.expand_path('../model', __FILE__)

# Sets logger
def logto(file)
  file = File.open(File.expand_path("../logs/#{file}.log", __FILE__), "w")
  ActiveRecord::Base.logger = Logger.new(file)
  ActiveSupport::LogSubscriber.colorize_logging = false
end