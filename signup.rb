$LOAD_PATH<<'.'
require 'io/console'

module Signup
  def self.addAccountant
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
  end

  def self.addCashier
    puts "Signing Up as Cashier"
    
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
  end
  def self.addCustomer
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
  end
end
