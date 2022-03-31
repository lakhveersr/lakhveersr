def cashier
  $LOAD_PATH<<'.'
  require 'classes'
  require 'io/console'
  
  a=[]
  f=File.open("Cashier.txt","a+")
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
  puts "Welcome #{a[3]} #{a[4]}"
  cust_det=""
     
  while true
    puts "Press 1 to Continue and 0 to Sign Out"
    j=gets.chomp.to_i

    case j
    when 1 
      b=[]
      puts "Enter Customer User Id"
      usid=gets.chomp.to_s
      flag=true
      f=File.open("Customer.txt","a+")
      f.each do |line|
        if line.match /^#{usid}/
          s=""
          l=0
          flag=false
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
      if flag
        puts "Data Not Found"
      else
        h=Hash.new
        h={"User Id"=>"","Password"=>"","Account No."=>"","Id Proof No."=>"","Full Name"=>"","Last Name"=>"","Balance"=>""}
        k=0
        h.each_key { |key| 
        h[key]=b[k] unless k==1
        k+=1 }
        h["Full Name"]=h["Full Name"].to_s+" "+h["Last Name"].to_s
        h.delete "Last Name"
        puts h
        puts "Enter : "
        puts "1 to Withdraw"
        puts "2 to Credit"
        puts "0 to Exit"
        j=gets.chomp.to_i
             
        case j
        when 1
          puts "Enter Amount To Withdraw"
          amt=gets.chomp.to_i
          bal=h["Balance"]
          if bal.to_i>=amt
            b=bal.to_i-amt
            cd=cust_det
            cust_det=cust_det.gsub(/#{bal}/,b.to_s)
            File.write("Customer.txt",File.open("Customer.txt",&:read).gsub(cd,cust_det))
          else
            puts "Insufficient Balance! Try with Lower Amount"
          end
        when 2
          puts "Enter Amount To Credit"
          amt=gets.chomp.to_i
          bal=h["Balance"]
          b=bal.to_i+amt
          cd=cust_det
          cust_det=cust_det.gsub(/#{bal}/,b.to_s)
          File.write("Customer.txt",File.open("Customer.txt",&:read).gsub(cd,cust_det))
        when 0
        else 
          puts "Wrong Choice"
        end
      end
      when 0
        break
      else
        puts "Wrong Choice"
    end
  end  
end