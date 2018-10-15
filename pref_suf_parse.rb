# Open file with names list

current_path = File.dirname(__FILE__)

file_path = "#{current_path}/data/parsed_2.txt"

full = File.readlines(file_path)

matched_pref = []
matched_suf = []

full.each do |line|
  matched_pref << /^\w+/.match(line).to_s
  matched_suf << /\s\w+$/.match(line).to_s.gsub(/\s/, '')
end

puts matched_pref.sort.uniq
puts matched_suf.sort.uniq

parsed_pref = File.new("#{current_path}/data/pref.txt", 'w')

matched_pref.sort.uniq.each do |line|
  parsed_pref.puts "#{line},"
end

parsed_pref.close

parsed_suf = File.new("#{current_path}/data/suff.txt", 'w')

matched_suf.sort.uniq.each do |line|
  parsed_suf.puts "#{line},"
end

parsed_suf.close
