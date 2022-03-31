$LOAD_PATH<<'.'
require 'classes'
require 'Accountant'
require 'Cashier'
require 'Customer'
require 'signup'
require 'validate'
require 'io/console'
require "Admin"

puts "Welcome to AB Bank"

while true do
  puts "Enter : "
  puts "1 to Continue as Admin"
  puts "2 to Continue as Accountant"
  puts "3 to Continue as Customer"
  puts "4 to Continue as Cashier"
  puts "0 to Exit"
  j=gets.chomp.to_i
  
  case j
    when 1
      puts "Welcome Admin :"
      puts "Enter Your User ID"
      $usid=gets.chomp.to_s
      puts "Enter Your Password"
      pass=STDIN.noecho(&:gets).chomp.to_s
      a=Validate.admin($usid,pass)
      puts a
      if a=="Success"
        admin
      else
        puts "Wrong Credentials"
      end
    when 2
      puts "Welcome Accountant\nPress : "
      puts "1 to Login\n2 to Signup"
      j=gets.chomp.to_i

      case j
        when 1
          puts "Enter Your User ID"
          $usid=gets.chomp.to_s
          puts "Enter Your Password"
          pass=STDIN.noecho(&:gets).chomp.to_s
          a=Validate.accountant($usid,pass)
          puts a
          if a=="Success"
            accountant
            next
          else
            puts "Wrong Credentials"
          end
        when 2
          Signup.addAccountant
        else 
          puts "Wrong Choice"
        end
    when 3
      puts "Welcome Customer\nPress : "
      puts "1 to Login\n2 to Signup"
      j=gets.chomp.to_i
    
      case j
      when 1
        puts "Enter Your User ID"
        $usid=gets.chomp.to_s
        puts "Enter Your Password"
        pass=STDIN.noecho(&:gets).chomp.to_s
        a=Validate.customer($usid,pass)
        puts a
        if a=="Success"
          customer
          next
        else
          puts "Wrong Credentials"
        end
      when 2
        Signup.addCustomer
      else 
        puts "Wrong Choice"
      end
    when 4
      puts "Welcome Cashier\nPress : "
      puts "1 to Login\n2 to Signup"
      j=gets.chomp.to_i

      case j
      when 1
        puts "Enter Your User ID"
        $usid=gets.chomp.to_s
        puts "Enter Your Password"
        pass=STDIN.noecho(&:gets).chomp.to_s
        a=Validate.cashier($usid,pass)
        puts a
        if a=="Success"
          cashier
          i=nil
          next
        else
          puts "Wrong Credentials"
        end
      when 2
        Signup.addCashier
      else 
        puts "Wrong Choice"
      end
    when 0
      puts "Exit"
      break
    else 
      puts "Wrong Choice"
  end
end
