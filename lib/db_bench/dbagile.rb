require "dbagile"
module DbBench
  module DbAgile
    extend ::DbAgile::Environment::Delegator
    
    def self.environment
      @environment ||= begin
        env = ::DbAgile::Environment.new
        env.repository_path = File.expand_path('../../../dbagile', __FILE__)
        env
      end
    end
    
  end # module DbAgile
end # module DbBench
require "db_bench/dbagile/challenge1"
require "db_bench/dbagile/challenge2"
require "db_bench/dbagile/challenge3"
require "db_bench/dbagile/challenge4"
