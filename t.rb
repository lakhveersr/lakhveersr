loop do 
  fname=gets.chomp.to_s 
  unless fname.empty?
    break
  else 
    puts "Could not be empty"
  end
end 