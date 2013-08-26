# INFO: Install with `gem install --no-rdoc --no-ri --no-user-install hirb awesome_print pry pry-doc pry-rescue pry-syntax-hacks`
# FIXME: as for now all these gems are installed in both system ruby and userspace ruby. Need to find a way to `chruby ruby` so we use userspace only.

['hirb', 'awesome_print'].each do |gem|
  begin
    require gem
  rescue LoadError
    puts "warning: #{gem} not available"
  end
end

begin
  require 'pry'
# TODO: pry-debugger pry-stack_explorer
  ['pry-doc', 'pry-rescue', 'pry-syntax-hacks'].each do |gem|
    begin
      require gem
    rescue LoadError
      puts "warning: #{gem} not available"
    end
  end

  Pry.start
  exit
rescue LoadError
  puts "warning: Pry not available"
end
