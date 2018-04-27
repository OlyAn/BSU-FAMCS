require 'pry'

now = Time.now
counter = 10
loop do
  if Time.now < now + counter
    next
  else
    puts "Получение данных с датчиков ..."
    random_temperatures = []
    10.times{random_temperatures << rand(0..100)}
    puts "Полученные данные: #{random_temperatures}"
    random_temperatures.each_with_index do |r, index|
      state = case r
      when 40..55
        0.25
      when 55..70
        0.5
      when 70..85
        0.75
      when 85..100
        1
      end

      case state
      when 0.25
        puts "Отправить машину в район номер #{index+1}; состояние: #{state}"
      when 0.5
        puts "Отправить бригаду в район номер #{index+1}; состояние: #{state}"
      when 0.75
        puts "Отправить районную бригаду в район номер #{index+1}!!!; состояние: #{state}"
      when 1
        puts "Отправить областную бригаду в район номер #{index+1}!!!; состояние: #{state}"
      end
    end
  end
  counter += 10
end
