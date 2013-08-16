# TODO: use hirb, awesome print. install them and pry globally
begin
  require 'pry'
  Pry.start
  exit
rescue LoadError
  puts "warning: Pry not available"
end
