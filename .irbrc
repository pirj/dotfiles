begin
  require 'pry'
  Pry.start
  exit
rescue LoadError
  puts "warning: Pry not available"
end
