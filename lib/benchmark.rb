
module WhatWeb
  class Benchmark

    @@results={}

    def self.start(name)
      return BM.new(name,@@results)
    end

    def self.results
      return @@results
    end


    class BM
      attr_accessor :start,:results,:name
      def initialize(name,results)
        @results=results
        @name=name
        @start=Time.now
      end

      def finish
        fin=Time.now
        @results[@name]||={}
        @results[@name][:runs]||=0
        @results[@name][:total]||=0
        @results[@name][:runs]+=1
        @results[@name][:total]+=fin-@start
      end

    end

  end
end
