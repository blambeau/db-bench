module DbBench
  class Challenge
    
    def self.inherited(clazz)
      @challenges ||= []
      @challenges << clazz
    end
    
    def self.print_measures(measures)
      measures.each_pair do |meth,tms|
        puts "    %-20s %s" % [meth, tms]
      end
    end

    def self.run_all
      # build challenges by name
      challenges = Hash.new{|h,k| h[k] = []}
      @challenges.each do |chalclazz|
        name = chalclazz.name.split("::").last
        challenges[name] << chalclazz
      end
      
      # run challenges
      challenges.each_pair do |key,classes|
        puts "Running challenge #{key}"
        classes.sort{|c1,c2| c1.name.to_s <=> c2.name.to_s}.each{|clazz|
          puts "  #{clazz.name.split('::')[-2]}"
          measures = {}
          clazz.new.run(measures)
          print_measures(measures)
        }
      end
    end
    
    def output(str)
      #puts str
    end
    
    def measure(times = 50)
      tms = (1..times).inject(Benchmark::Tms.new){|tms,i|
        tms + Benchmark.measure{ yield }
      }
      tms / times
    end
  
  end # class Challenge
end # module DbBench