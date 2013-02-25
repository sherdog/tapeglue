class SimpleBenchMarker

	def self.go(how_many = 1, &block)
		puts "------------------------------- benchmarking started --------------"
		start_time = Time.now
		puts "Start Time:\t#{start_time}\n\n"

		how_many.times do |a|
			print "."
			block.call
		end

		print "\n\n"
		end_time = Time.now
		puts "End time: \t#{end_time} \n"
		puts "---------------------- benchmarking finished ---------------\n\n"
		puts "Result:\t\t#{end_time - start_time} seconds"
	end

end

SimpleBenchMarker.go 5 do 
	time = rand(4)
	sleep time
end