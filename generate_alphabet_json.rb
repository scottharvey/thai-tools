#!/usr/bin/ruby

require 'csv'
require 'json'

File.open("source/alphabet.json",'w') do |json_file|
  result = []
  csv = CSV.foreach('alphabet.csv', headers: true) do |row|
    result << row.to_hash
  end
  json_file.write JSON.pretty_generate(result)
end
