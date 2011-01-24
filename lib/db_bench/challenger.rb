module DbBench
  class Challenger
    
    def self.inherited(subclass)
      @challengers ||= []
      @challengers << subclass
    end
    
    def self.each
      @challengers.each{|subclass|
        yield(subclass.new) 
      }
    end
    
    def self.run_all_once
      @challengers.each{|subclass|
        puts "Running all_one on #{subclass}"
        challenger = subclass.new
        challenger.run_all_once
      }
    end
    
    def name
      self.class.name.split('::')[1..-1].join('::')
    end
    
    def album_count
      500
    end
    
    def output(*args)
    end
    
    def run_all_once
      setup
      challenge1
      challenge2
      challenge3
      challenge4
      challenge5
      teardown
    end
    
  end # class Challenger
end # module DbBench