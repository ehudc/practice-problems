=begin
Description:
Write a program that finds the total number
of "sum days" in a given decade,
and displays those days in output
(assume no leap years, since this is
by generic decade and not by century)

For example:

First decade, year 02, has only one sum-day:
01/01/02 i.e. 01 + 01 = 02

=end

$dpm = { # days per month
  1 => 31, 2 => 28, 3 => 31,
  4 => 30, 5 => 31, 6 => 30,
  7 => 31, 8 => 31, 9 => 30,
  10 => 31, 11 => 30, 12 => 31
}

def sumDays(decade, output = false)
  sum = Array.new
  total = 0
  first = 10*(decade-1)
  last = decade*10 - 1
  
  (first..last).each do |s|
    (1..$dpm.length).each do |m|
      for d in 1..$dpm[m]
        if d + m == s
          sum << m.to_s.rjust(2, '0') + "/" \
                + d.to_s.rjust(2, '0') + "/" \
                + s.to_s.rjust(2, '0')
          total += 1
        end
      end
    end
  end
  if sum.empty?
    puts "The " + decade.to_s + "th decade is too large for sum-days!"
  end
  puts "The total number of sum-days is: " + total.to_s
  if output
    puts "The list of dates are: "
    puts sum
  end
end

sumDays(5, true)
