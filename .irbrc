require 'pry'
begin
  require 'pry-doc'
rescue LoadError
  puts 'Cannot load pry-doc'
end

if defined? ::Rails
  include Rails::ConsoleMethods
  begin
    require 'pry-rails'
  rescue LoadError
    puts 'Cannot load pry-rails'
  end
  ActiveRecord::Base.logger = Logger.new STDOUT
end

Pry.start
exit
