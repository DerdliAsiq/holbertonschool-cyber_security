#!/usr/bin/env ruby
require 'net/http'
require 'uri'
require 'json'

def get_request(url)
  uri = URI.parse(url)
  response = Net::HTTP.get_response(uri)

  puts "Response status: #{response.code} #{response.message}"
  puts "Response body:"
  
  begin
    # Gelen yanıtı JSON olarak parse edip "Pretty JSON" (alt alta) formatında basıyoruz
    parsed_body = JSON.parse(response.body)
    puts JSON.pretty_generate(parsed_body)
  rescue JSON::ParserError
    # Eğer dönen veri geçerli bir JSON değilse olduğu gibi bas
    puts response.body
  end
end