require 'pry'
require 'pry-doc'

if defined? ::Rails
  include Rails::ConsoleMethods
  require 'pry-rails'
  ActiveRecord::Base.logger = Logger.new STDOUT
end

Pry.start
exit
