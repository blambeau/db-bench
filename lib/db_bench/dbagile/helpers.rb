module DbBench
  module DbAgile
    module Helpers
  
      def environment
        @environment ||= begin
          env = ::DbAgile::Environment.new
          env.repository_path = File.expand_path('../../../../dbagile', __FILE__)
          env
        end
      end
    
      def database
        @database ||= environment.repository.database(:dbagile)
      end
  
      def connection
        @connection ||= database.connect
      end
  
      def dataset(whichone)
        connection.dataset(whichone)
      end
  
      def setup
        connection
      end

      def teardown
        connection.disconnect
      end
      
    end # module Helpers
  end # module DbAgile
end # module DbBench