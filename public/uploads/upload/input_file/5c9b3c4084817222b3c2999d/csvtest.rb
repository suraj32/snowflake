require 'csv'
csv_text = File.read('test.csv')
csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  #rowi = row.to_hash
  puts "#{row}"
  puts "#{row.fetch('email')}"
  puts "#{row.fetch('name')}"
  #puts "#{rowi}"
  puts "#{row.class}"
  #puts "#{rowi.class}"
end
