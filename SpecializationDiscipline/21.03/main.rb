puts 'Введите количество синапсов: '
n = gets.to_i
synapses = []
n.times do
  synapses << rand(0.0...1.0)
end

dendrites = []
n.times do
  dendrites << rand(0.0...1.0)
end


sum = dendrites.inject(0) {|sum, x| sum + x }
puts "Сумма: #{sum}"
puts "Порог: #{n/2}"

if sum >= n - 0.05
  puts 'Перепроверьте! Подозрительно недостоверне входные данные'
elsif sum >= n/2
  puts 'Сигнал идет'
else
  puts 'Сумма меньше порога. Сигнал не идет'
end
