def accountant
  $LOAD_PATH<<'.'
  require 'classes'
  require 'io/console'
  a=[]
  f=File.open("Accountant.txt","a+")
  f.each do |line|
    if line.match /#{$usid}/
      s=""
      i=0
      line.each_char do |c|
        unless c=='$'
          s+=c 
        else
          a[i]=s
          i+=1
          s=""
        end
      end
    end
  end
  f.close
  puts "Welcome #{a[3]}#{a[4]}"

  while true
    puts "Enter : "
    puts "1 to Add a Customer"
    puts "2 to view Customers Lists"
    puts "3 to Delete a Customer"
    puts "0 to Sign Out"
    j=gets.chomp.to_i

    case j
    when 1 
      puts "Adding a Customer"
    
    loop do
      puts "Enter First Name"
      @fname=gets.chomp.to_s
      unless @fname.empty?
        break
      else
        puts "Could Not Be Empty"
      end
    end

    loop do
      puts "Enter Last Name"
      @lname=gets.chomp.to_s
      unless @lname.empty?
        break
      else
        puts "Could Not Be Empty"
      end
    end

    loop do
      puts "Enter Id Proof No."
      @idp=gets.chomp.to_s
      unless @idp.empty?
        break
      else
        puts "Could Not Be Empty"
      end
    end

    loop do
      puts "Enter User Id"
      @usid=gets.chomp.to_s
        unless @usid.empty?
          flag=true

          while flag do
            c=0
            f=File.open("Customer.txt","a+")
            f.each do |line|
              if line.match /^#{@usid}/
                puts "User Id Already Taken"
                c+=1
              end
            end
            flag=false if c==0
          end
          f.close
          break
        else
          puts "Could Not be Empty"
        end
      end

      while true do
        puts "Enter Your New Password"
        @pass=STDIN.noecho(&:gets).chomp.to_s
        puts "Confirm Password"
        @npass=STDIN.noecho(&:gets).chomp.to_s
        if @pass.empty?
          puts "Could Not Be Empty"
        elsif @pass==@npass
          break
        else
          puts "Password doesn't Match"
        end
      end
      @bal=1000
      acc1=Customer.new(@fname,@lname,@idp,@usid,@pass,@bal)
      acc1.add
    when 2
      cus=[]
      f1=File.open("Customer.txt","a+")
      f1.each do |line|
        s=""
        i=0
        line.each_char do |c|
          unless c=='$'
            s+=c 
          else
            cus[i]=s
            i+=1
            s=""
          end
        end
        h=Hash.new
        h={"Customer Id"=>"","Password"=>"","Account No."=>"","Id Proof No."=>"","Full Name"=>"","Last Name"=>"","Balance"=>""}
        k=0
        h.each_key { |key| 
          h[key]=cus[k] unless k==1
        k+=1 }
        h["Full Name"]=h["Full Name"].to_s+" "+h["Last Name"].to_s
        h.delete "Last Name"
        puts h
      end
      f1.close
    when 3
      puts "Deleting Customer"
      puts "Enter the User ID"
      usid=gets.chomp.to_s
      Customer.delete(usid)
    when 0
      break
    else puts "Wrong Choice"
    end
  end   
end