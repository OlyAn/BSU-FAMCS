require 'pry'
y1 = 20
y2 = 20

states = [0.0, 0.25, 0.5, 0.75, 1.0]

tractor1 = { y1: rand(0..20), y2: rand(0..20), state: states.sample}
tractor2 = { y1: rand(0..20), y2: rand(0..20), state: states.sample}

puts

while true
  [tractor1, tractor2].each_with_index do |tractor, index|
    tractor[:state] = states.sample
    tractor[:y1] = [true, false].sample ? y1 + 4 : y1 - 4
    tractor[:y2] = [true, false].sample ? y2 + 4 : y2 - 4

    case tractor[:state]
      when 0.0
        puts "Трактор #{index} в отлином состоянии; состояние: #{tractor[:state]}"
      when 0.25
        puts "Трактор #{index} в хорошем состонии; состояние: #{tractor[:state]}"
      when 0.5
        puts "Трактор #{index} в исправном состоянии: #{tractor[:state]}"
      when 0.75
        puts "Трактор #{index} нуждается в ремонте; состояние: #{tractor[:state]}"
      when 1
        puts "Трактор #{index} нуждается в срочном ремонте!!! состояние: #{tractor[:state]}"
    end

    if (tractor[:y1] < 0 || tractor[:y1] > 20 || tractor[:y2] < 0 || tractor[:y2] > 20)
      puts "Трактор #{index} вышел за периметр поля! Вызвать охрану"
    end
  end
  puts ""
  sleep 3
end
