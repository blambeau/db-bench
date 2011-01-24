require 'rubygems'
require 'yaml'
require 'logger'
require 'benchmark'
module DbBench
  
end # module DbBench
require "db_bench/challenge"
require "db_bench/active_record"
require "db_bench/dbagile"
DbBench::Challenge.run_all