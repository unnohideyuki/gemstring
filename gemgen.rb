#!/usr/bin/env ruby

class GemGen
  def initialize(len, prefix, gems)
    @len = len
    @prefix = prefix
    @gems = gems
  end

  def i2c(i)
    "abcdefg"[i]
  end

  def each &b
    b.call(@prefix)

    if @len > 0
      @gems.each_with_index do |n, i|
        if n > 0
          subgems = @gems.dup
          subgems[i] -= 1
          c = i2c(i)
          newprefix = "#{@prefix}#{c}"
          g = GemGen.new(@len - 1, newprefix, subgems)
          g.each {|str| b.call(str)}
        end
      end
    end
  end
end

Enumerator.new(GemGen.new(16, "", [1, 4, 1, 4, 2, 1, 3])).each_with_index do |s, i|
  if s == "eagcdfbe"
    puts "#{i}:#{s}"
    break
  end
end