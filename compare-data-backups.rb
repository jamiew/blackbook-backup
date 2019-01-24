#!/usr/bin/env ruby

dir1 = Dir["data/*"].map{|f| f.gsub(/^data\//,'').gsub(/\.gml$/,'') }.sort
dir2 = Dir["data-json/*"].map{|f| f.gsub(/^data-json\//,'').gsub(/\.json$/,'') }.sort

puts dir1.length
puts dir2.length

puts "Missing in data/:"
puts (dir2 - dir1).inspect

puts "Missing in data-json/:"
puts (dir1 - dir2).inspect
