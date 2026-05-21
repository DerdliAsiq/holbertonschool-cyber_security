#!/usr/bin/env ruby
require 'optparse'

tasks_file = 'tasks.txt'
options = {}

opt_parser = OptionParser.new do |opts|
  opts.banner = "Usage: cli.rb [options]"

  opts.on("-a", "--add TASK", "Add a new task") do |task|
    options[:add] = task
  end

  opts.on("-l", "--list", "List all tasks") do
    options[:list] = true
  end

  opts.on("-r", "--remove INDEX", "Remove a task by index") do |index|
    options[:remove] = index.to_i
  end

  opts.on("-h", "--help", "Show help") do
    puts opts
    exit
  end
end

begin
  opt_parser.parse!(ARGV)
rescue OptionParser::InvalidOption
  puts opt_parser
  exit
end

if options[:add]
  File.open(tasks_file, 'a') do |f|
    f.puts(options[:add])
  end
  puts "Task '#{options[:add]}' added."

elsif options[:list]
  if File.exist?(tasks_file) && !File.zero?(tasks_file)
    puts "Tasks:"
    File.open(tasks_file, 'r').each_line do |line|
      puts line.strip
    end
  else
    puts "No tasks found."
  end

elsif options[:remove]
  if File.exist?(tasks_file)
    lines = File.readlines(tasks_file)
    idx_to_remove = options[:remove] - 1

    if idx_to_remove >= 0 && idx_to_remove < lines.length
      removed_task = lines.delete_at(idx_to_remove).strip
      File.open(tasks_file, 'w') do |f|
        lines.each { |line| f.write(line) }
      end
      puts "Task '#{removed_task}' removed."
    else
      puts "Invalid task index."
    end
  else
    puts "No tasks to remove."
  end

else
  puts opt_parser
end