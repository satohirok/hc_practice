require 'date'
require 'optparse'

def calender(year,month)
    date = Date.new(year,month)
    year = date.year
    month = date.mon
    last_day = Date.new(year,month,-1).mday
    first_day = Date.new(year,month,1).mday
    first_wday = Date.new(year,month,1).wday
    
    p "    #{month}月 #{year}年    "
    p "月 火 水 木 金 土 日"
    
    if first_wday == 0
        first_wday += 7
    end
    blank = '   ' * (first_wday - 1)
    print blank
    
    first_day.upto(last_day) {|d| 

     print "#{d}".rjust(3)

     if ((first_wday -1) + d) % 7 == 0
         puts "\n"
     end
    }
end

def opt
  today = Date.today
  tmonth = today.month
  
  options = {}

  OptionParser.new do |opts|
    opts.on('-m MONTH') do |month|
      options[:month] = month.to_i
    end
  end.parse!
  
  month = options[:month] || tmonth
  if month > 0 && month <= 12
    test(month)
  else
    raise  ArgumentError , "#{month} is neither a month number (1..12) nor a name"
  end
end

def test(month)
  today = Date.today
  year = today.year
  
  calender(year,month)
end
opt