Pry.config.editor = 'vim'

Pry::Commands.block_command 'trace', 'caller omitting any third party code' do
  _pry_.input = StringIO.new 'caller.grep(Regexp.new(Dir.pwd)).map { |path| path.gsub "#{Dir.pwd}/", "" }'
end

if defined? PG
  original_handler = Pry.config.exception_handler
  Pry.config.exception_handler = proc do |output, exception, _pry_|
    case exception.cause
    when PG::InFailedSqlTransaction
      ActiveRecord::Base.connection.rollback_transaction
      ActiveRecord::Base.connection.begin_transaction(joinable: false)
    end
    original_handler.call output, exception, _pry_
  end
end

global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
all_global_gem_paths.each do |p|
  gem_path = "#{p}/lib"
  $LOAD_PATH << gem_path
end
