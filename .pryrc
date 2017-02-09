Pry.config.editor = 'vim'

Pry::Commands.block_command 'trace', 'caller omitting any third party code' do
  _pry_.input = StringIO.new 'caller.select { |line| line =~ Regexp.new(Dir.pwd) }'
end
