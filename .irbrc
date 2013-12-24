# https://github.com/carlhuda/bundler/issues/183#issuecomment-1149953
if defined?(::Bundler)
  global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
  if global_gemset
    all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
    all_global_gem_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end

def load_gem gem
  require gem
rescue LoadError
  puts "warning: #{gem} not available"
end

['hirb', 'awesome_print'].each do |gem|
  load_gem gem
end

begin
  require 'pry'
  ['pry-doc', 'pry-rescue', 'pry-syntax-hacks', 'pry-debugger', 'pry-stack_explorer'].each do |gem|
    load_gem gem
  end

  Pry.start
  exit
rescue LoadError
  puts "warning: Pry not available"
end
