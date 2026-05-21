#!/usr/bin/env ruby
require 'json'

def count_user_ids(path)
  return unless File.exist?(path)

  file_content = File.read(path)
  data = JSON.parse(file_content)

  counts = Hash.new(0)
  data.each do |item|
    if item['userId']
      counts[item['userId']] += 1
    end
  end

  counts.each do |user_id, count|
    puts "#{user_id}: #{count}"
  end
end