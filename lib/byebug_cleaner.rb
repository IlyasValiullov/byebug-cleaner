module ByebugCleaner
  require 'optparse'
	require 'fileutils'
	
	require 'byebug_cleaner/railtie' if defined?(Rails)
	require 'byebug_cleaner/version'

  class OptparseByebugCleaner

	  class ScriptOptions
	    attr_accessor :dir, :backup, :test

	    def initialize
	      self.dir = "app"
	      self.backup = true
	      self.test = 0
	    end

	    def define_options(parser)
	      parser.banner = "Usage: rake byebug:clean -- [options]"
	      parser.separator "Task recursively search files where 'byebug' uses and remove this line from file."
	      parser.separator ""
	      parser.separator "Default options:"
	      parser.separator "	Dir - {RAILS_APP}/app"
	      parser.separator "	Backup - true"
	      parser.separator ""
	      parser.separator "Specific options:"

	      # add additional options
	      dir_option(parser)
	      boolean_backup_option(parser)

	      parser.separator ""
	      parser.separator "Common options:"
	      # No argument, shows at tail.  This will print an options summary.
	      # Try it and see!
				parser.on("-h", "--help", "Prints this help") do
					puts parser
					exit
				end
	      # Another typical switch to print the version.
	      parser.on("-v", "Show version") do
	        puts VERSION
	        exit
	      end
	      parser.separator ""
	      parser.separator "Examples:"
	      parser.separator "	rake byebug:clean"
	      parser.separator "	rake byebug:clean -- -dspec"
	      parser.separator "	rake byebug:clean -- --dir=app/models --no-debug"
	    end


	    def dir_option(parser)
	      # Cast 'time' argument to a Time object.
	      parser.on("-dDIR", "--dir=DIR", String, "Set dir for searching") do |dir|
	        self.dir = dir
	      end
	    end


	    def boolean_backup_option(parser)
	      # Boolean switch.
	      parser.on("-b", "--[no-]backup", "Backup files") do |b|
	        self.backup = b
	      end
	    end
	  end

	  #
	  # Return a structure describing the options.
	  #
	  def parse(args)
	    # The options specified on the command line will be collected in
	    # *options*.
	    @options = ScriptOptions.new
	    opt_parser = OptionParser.new  do |parser|
	    	@options.define_options(parser)
	    end
	    opt_parser.parse!(args)
	    
	    @options
	  end

	  # attr_reader :parser, :options
	end  # class OptparseExample


	def green_str string
  	"\e[32m#{string}\e[0m"
  end
 	def cyan_str string
  	"\e[36m#{string}\e[0m"
  end
end
