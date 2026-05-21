#!/usr/bin/env ruby
require 'json'

def merge_json_files(file1_path, file2_path)
  return unless File.exist?(file1_path) && File.exist?(file2_path)

  file1_content = File.read(file1_path)
  file2_content = File.read(file2_path)

  data1 = JSON.parse(file1_content)
  data2 = JSON.parse(file2_content)

  # Array formatındaki iki JSON nesnesini birleştirme
  merged_data = data2 + data1

  File.open(file2_path, 'w') do |f|
    f.write(JSON.pretty_generate(merged_data))
  end
end