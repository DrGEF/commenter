def edit

	@type   = ARGV.shift
	@string = ARGV.shift
	@size   = ARGV.shift

	@size = 60 if @size.nil?

	if @type == 'html'
		@before = '<!-- '
		@after  = ' -->'		
	elsif @type == '//'
		@before = '// '
		@after  = ''
	else
		@before = '/* '
		@after  = ' */'
	end

	@length = @size - @string.length - @before.length - @after.length - 2

	unless @length%2 == 0
		@string += ' '
	end

	@length = @length/2

	@fill = ''

	@length.times do
		@fill += '*'
	end

	@result = @before + @fill + " " + @string + " " + @fill + @after
	system('echo \'' + @result + '\' | xclip -o')
	puts @result
	puts 'Скопировано в буфер';

end
edit