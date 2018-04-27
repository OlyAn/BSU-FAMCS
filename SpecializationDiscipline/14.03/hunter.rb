require 'pry'

now = Time.now
counter = 3
animals = {'заяц': 0.0, 'кабан': 0.25, 'горилла': 0.5, 'крокодил': 0.75, 'лев': 1.0}
loop do
  if Time.now < now + counter
    next
  else
    animal = animals.keys.sample
    case animals[animal]
    when 0.0
      puts "Можно охотиться на #{animal}. Состояние опасности: #{animals[animal]}"
    when 0.25
      puts "Охота на расстоянии на #{animal}! Состояние опасности: #{animals[animal]}"
    when 0.5
      puts "Осторожная охота на расстоянии на #{animal}! Состояние опасности: #{animals[animal]}"
    when 0.75
      puts "Опасность у водоема: #{animal}! Состояние опасности: #{animals[animal]}"
    when 1.0
      puts "Закончить охоту!!! Опасность: #{animal}! Состояние опасности: #{animals[animal]}"
    end
  end
  counter += 3
end
