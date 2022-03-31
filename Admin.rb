def admin
  $LOAD_PATH<<'.'
  require 'classes'
  require 'io/console'
  a=[]
  f=File.open("Admin.txt","a+")
  f.each do |line|
    if line.match /^#{$usid}/
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
  puts "Welcome #{a[2]}#{a[3]}"

  while true
    puts "Enter : "
    puts "1 to Add a Accountant"
    puts "2 to view Accountants List"
    puts "3 to Delete a Accountant"
    puts "4 to Add a Cashier"
    puts "5 to View Cashiers List"
    puts "6 to Delete a Cashier"
    puts "7 to Add Customer"
    puts "8 to View Customers List"
    puts "9 to Delete a Customer"
    puts "10 to change Password"
    puts "0 to Sign Out"
    j=gets.chomp.to_i
    
    case j 
    when 1     
      puts "Signing Up as Accountant"
      
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
            f=File.open("Accountant.txt","a+")
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
      acc1=Accountant.new(@fname,@lname,@idp,@usid,@pass)
      acc1.add
    when 2
      puts "Accountants List :"
      acc=[]
      f1=File.open("Accountant.txt","a+")
      f1.each do |line|
        s=""
        i=0
        line.each_char do |c|
          unless c=='$'
            s+=c 
          else
            acc[i]=s
            i+=1
            s=""
          end
        end
        h=Hash.new
        h={"Accountant Id"=>"","Password"=>"","Id Proof No."=>"","Full Name"=>"","Last Name"=>""}
        k=0
        h.each_key { |key| 
          h[key]=acc[k] unless k==1
        k+=1 }
        h["Full Name"]=h["Full Name"].to_s+" "+h["Last Name"].to_s
        h.delete "Last Name"
        puts h
      end
      f1.close
    when 3
      puts "Deleting Accountant"
      puts "Enter the User ID"
      usid=gets.chomp.to_s
      Accountant.delete(usid)
    when 4
      puts "Adding a Cashier"
    
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
            f=File.open("Cashier.txt","a+")
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
      acc1=Cashier.new(@fname,@lname,@idp,@usid,@pass)
      acc1.add
    when 5
      puts "Cashiers List :"
      cashier=[]
      f1=File.open("Cashier.txt","a+")
      f1.each do |line|
        s=""
        i=0
        line.each_char do |c|
          unless c=='$'
            s+=c 
          else
            cashier[i]=s
            i+=1
            s=""
          end
        end
        h=Hash.new
        h={"Cashier Id"=>"","Password"=>"","Id Proof No."=>"","Full Name"=>"","Last Name"=>""}
        k=0
        h.each_key { |key| 
          h[key]=cashier[k] unless k==1
        k+=1 }
        h["Full Name"]=h["Full Name"].to_s+" "+h["Last Name"].to_s
        h.delete "Last Name"
        puts h
      end
      f1.close
    when 6
      puts "Deleting Cashier"
      puts "Enter the User ID"
      usid=gets.chomp.to_s
      Cashier.delete(usid)
    when 7
      puts "Signing Up as Customer"
    
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
    when 8
      puts "Customers List :"
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
    when 9
      puts "Deleting Customer"
      puts "Enter the User ID"
      usid=gets.chomp.to_s
      Customer.delete(usid)
    when 10
      b=[]
      cust_det=""
      f=File.open("Admin.txt","a+")
      f.each do |line|
        if line.match /^#{$usid}/
          s=""
          l=0
          cust_det=line
          line.each_char do |c|
            unless c=='$'
              s+=c 
            else
              b[l]=s
              l+=1
              s=""
            end
          end
          break
        end
      end
      f.close
      
      while true
        puts "Enter Current Password"
        pass=STDIN.noecho(&:gets).chomp.to_s
        if a[1]==pass
          
          while true do
            puts "Enter Your New Password"
            npass=STDIN.noecho(&:gets).chomp.to_s
            puts "Confirm Password"
            npass2=STDIN.noecho(&:gets).chomp.to_s
            if npass.empty?
              puts "Could Not Be Empty"
            elsif npass==npass2
              break
            else
              puts "Password doesn't Match"
            end
          end
          break
        else
          puts "Password not match"
        end
      end
      cd=cust_det
      cust_det=cust_det.gsub(/#{pass}/,npass)
      File.write("Admin.txt",File.open("Admin.txt",&:read).gsub(cd,cust_det))
    when 0
      break
    else puts "Wrong Choice"
    end
  end   
end