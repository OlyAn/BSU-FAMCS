good_words = []
File.open("Good.txt", "r") do |f|
  f.each_line { |line| good_words << line }
end
good_words.map! {|word| word.tr("\n","").strip}
bad_words = []
File.open("Bad.txt", "r") do |f|
  f.each_line { |line|  bad_words << line }
end
bad_words.map! {|word| word.tr("\n","").strip }

opinions = { 'good' => 0, 'bad' => 0}
text = []
File.open("Deputat.txt", "r") do |f|
  f.each_line { |line| text += line.split(' ') }
end
text.map! {|word| word.tr("\n","").strip }

good_words.each { |word| opinions['good'] += text.count(word) }
bad_words.each { |word| opinions['bad'] += text.count(word) }

puts opinions['good'] >= opinions['bad'] ? 'Отзывы о депутате в большинстве хорошие' : 'Отзывы о депутате в большинстве плохие'
puts ''

##################################################################
opinions['good'] = 0
opinions['bad'] = 0
text = []
File.open("Medication.txt", "r") do |f|
  f.each_line { |line| text += line.split(' ') }
end
text.map! {|word| word.tr("\n","").strip }

good_words.each { |word| opinions['good'] += text.count(word) }
bad_words.each { |word| opinions['bad'] += text.count(word) }

puts opinions['good'] >= opinions['bad'] ? 'Отзывы о лекарстве в большинстве хорошие' : 'Отзывы о лекарстве в большинстве плохие'
puts ''
