Pry.config.editor = 'vim'

Pry::Commands.block_command 'trace', 'caller omitting any third party code' do
  _pry_.input = StringIO.new 'caller.grep(Regexp.new(Dir.pwd)).map { |path| path.gsub "#{Dir.pwd}/", "" }'
end
