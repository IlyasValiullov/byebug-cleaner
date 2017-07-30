require 'byebug_cleaner.rb'

namespace :byebug do
  desc "Remove all byebug commands, 'byebug:clean -- -h' for more details."
  task :clean do
  	include ByebugCleaner


  	optparse = OptparseByebugCleaner.new
  	options = optparse.parse(ARGV[-1..ARGV.size])

  	# puts options.dir
  	# puts options.backup
  	root = Pathname.new("#{Dir.pwd}")
  	pwd = "#{Dir.pwd}/#{options.dir}"

		

  	puts "Folder for searching is #{options.dir}"


  	dirs = Dir[ File.join(pwd, '**', '*') ]
  	dirs.delete_if {|f| f.match(/bin/) or 
  										  f.match(/log/) or 
  										  File.directory?(f) }

  	filelist = Rake::FileList.new
  	filelist.include(dirs)

  	results = []
  	filelist.each do |file_name|
  		str = IO.read(file_name)    
			next if !str.match(/.*byebug.*/)
			FileUtils.cp(file_name, "#{file_name}.backup") if options.backup
			file_path = Pathname.new(file_name)
			file_clean_path = file_path.relative_path_from(root) 

			text = File.read(file_name)
  		new_content = text.gsub(/.*byebug.*/, "")

  		File.open(file_name, "w") {|file| file.puts new_content } 

  		results << file_clean_path
   	end

   	if results.size > 0
   		puts "Files was changed:"
   		results.each do |file_name| 
   			puts green_str(" - #{file_name}")
   		end
   	else
   		puts cyan_str("Byebug wasn't found.")
   	end

  end
end
