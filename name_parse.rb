# Open file with names list

current_path = File.dirname(__FILE__)

file_path = "#{current_path}/data/unparsed.txt"

full = []

File.readlines(file_path).map { |name| full.concat(name.split(/\W+/)) }

parsed = File.new("#{current_path}/data/parsed_2.txt", 'w')

full2 = full.map { |i| i.reverse }

full2.sort.uniq.each do |line|
  parsed.puts line.reverse
end

parsed.close
