require 'pry'
x = 500.times.map{ [0.0, 0.25, 0.5, 0.75, 1.0].sample }
v = ['отличное', 'хорошее', 'среднее', 'плохое', 'катастрофическое']
u = ['не нуждается в обследовании', 'не нуждается в обследовании', 'нуждается в обследовании', 'нуждается в скором обследовании', 'нуждается в срочнейшем обследовать']
result = {}
File.open('input', 'w') {
  |file|
  x.each do |x_i|
    file.write(x_i))
  end
}

x.each_with_index do |patient, i|
  case patient
  when 0.0
    result[i] = u[0]
  when 0.25
    result[i] = u[1]
  when 0.5
    result[i] = u[2]
  when 0.75
    result[i] = u[3]
  when 1.0
    result[i] = u[4]
  end
end

File.open('output', 'w') {
  |file|
  result.each do |x_i| 
    file.write(x_i))
  end
}
