file = File.open('inputs/day3')
diagnostic_report = File.readlines(file, chomp: true)
file.close

diagnostic_report.map! {|words| words.split("")}
diagnostic_report_transposed = diagnostic_report.transpose

gamma_rate = ""
diagnostic_report_transposed.each do |column|
  gamma_rate_bit = column.tally.sort_by {|number,freq| freq}.last[0]
  gamma_rate += gamma_rate_bit
end
epsilon_rate = gamma_rate.tr("01", "10")

puts "Gamma rate: #{gamma_rate}"
puts "Epsilon rate: #{epsilon_rate}"

power_consumption = gamma_rate.to_i(2) * epsilon_rate.to_i(2)

puts "Power consumption: #{power_consumption}"