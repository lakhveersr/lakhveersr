def customer
  $LOAD_PATH<<'.'
  require 'io/console'
  require 'classes'

  a=[]
  f=File.open("Customer.txt","a+")
  f.each do |line|
    if line.match /^#{$usid}\$/
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
  puts "Welcome #{a[4]} #{a[5]}"
  cust_det=""

  while true
    b=[]
    puts "Enter : "
    puts "1 to view Accountant Details"
    puts "2 to Change Your Password"
    puts "0 to Sign Out"
    f=File.open("Customer.txt","a+")
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
    j=gets.chomp.to_i

    case j 
      when 1
        sh=Hash.new
        h={"Customer Id"=>"","Password"=>"","Account No."=>"","Id Proof No."=>"","Full Name"=>"","Last Name"=>"","Balance"=>""}
        k=0
        h.each_key { |key| 
        h[key]=a[k] unless k==1
        k+=1 }
        h["Full Name"]=h["Full Name"].to_s+" "+h["Last Name"].to_s
        h.delete "Last Name"
        puts h
      when 2
        while true
          puts "Enter Current Password"
          pass=STDIN.noecho(&:gets).chomp.to_s
          if a[1]==pass

            while true do
              puts "Enter Your New Password"
              npass=STDIN.noecho(&:gets).chomp.to_s
              puts "Confirm Password"
              npass2=STDIN.noecho(&:gets).chomp.to_s
              if npass==npass2
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
        File.write("Customer.txt",File.open("Customer.txt",&:read).gsub(cd,cust_det))
      when 0
        break
      else 
        puts "Wrong Choice"
    end
  end   
end