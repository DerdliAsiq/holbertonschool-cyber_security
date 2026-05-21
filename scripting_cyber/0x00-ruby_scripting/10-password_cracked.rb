#!/usr/bin/env ruby
require 'digest'

if ARGV.length != 2
  puts "Usage: 10-password_cracked.rb HASHED_PASSWORD DICTIONARY_FILE"
  exit
end

hashed_password = ARGV[0]
dictionary_file = ARGV[1]

unless File.exist?(dictionary_file)
  puts "Dictionary file not found."
  exit
end

found = false

File.open(dictionary_file, 'r').each_line do |line|
  word = line.strip
  if Digest::SHA256.hexdigest(word) == hashed_password
    puts "Password found: #{word}"
    found = true
    break
  end
end

unless found
  puts "Password not found in dictionary."
end