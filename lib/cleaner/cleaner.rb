require 'cleaner/output'
module ByebugCleaner
	class Cleaner
		include ByebugCleaner

		def self.clean argv
			
			#Get options for clean
	  	optparse = ArgumentParser.new
	  	options = optparse.parse(argv[-1..argv.size])


	  	root = Pathname.new("#{Dir.pwd}")
	  	pwd = "#{Dir.pwd}/#{options.dir}"
	  	puts "Folder for searching is #{options.dir}"


	  	dirs = Dir[ File.join(pwd, '**', '*') ]
	  	dirs.delete_if {|f| File.directory?(f) }

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
	   			puts ByebugCleaner::green_str(" - #{file_name}")
	   		end
	   	else
	   		puts ByebugCleaner::cyan_str("Byebug wasn't found.")
	   	end
	  end
	end
end