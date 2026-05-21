#!/usr/bin/env ruby

def print_arguments
  if ARGV.empty?
    puts "No arguments provided."
  else
    ARGV.each do |arg|
      puts "Arguments:#{arg}"
    end
  end
end