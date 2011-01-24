require 'rubygems'
require 'active_record'
require 'yaml'
require 'logger'

# Connection config
config = YAML::load File.read(File.expand_path('../database.yml', __FILE__))
ActiveRecord::Base.establish_connection(config)

# Logging
file = File.open('dbbench-ar.log', "w")
ActiveRecord::Base.logger = Logger.new(file)
ActiveSupport::LogSubscriber.colorize_logging=false

# Model
require File.expand_path('../model', __FILE__)
