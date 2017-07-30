module ByebugCleaner
  require 'optparse'
	require 'fileutils'
	
	require 'cleaner/railtie' if defined?(Rails)
	require 'cleaner/version'
	require 'cleaner/output'
	require 'cleaner/parser'
	require 'cleaner/cleaner'
	
end
