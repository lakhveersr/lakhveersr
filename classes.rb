class Customer
  if File.exists?('Customer.txt')
    lines=File.readlines('Customer.txt')
    line=lines[lines.length-1]
    s=line.split("$")
    @@acc=s[2].to_i+1
  else
    @@acc=555500000
  end

  def initialize(fname,lname,idp,usid,pass,bal)
    @fname=fname
    @lname=lname
    @id=idp
    @usid=usid
    @pass=pass
    @bal=bal
  end

  def add
    File.write("Customer.txt",[@usid,@pass,@@acc,@id,@fname,@lname,@bal,"\n"].join("$"),mode:"a")
    puts "Successfully Added"
  end

  def self.delete(usid)
    lines=File.readlines('Customer.txt')
    lines1=lines.select{|s| !s.match /^#{usid}\$/}
    File.open("Customer.txt", "w") do |f|
      f.puts(lines1)
    end
    if lines==lines1
      puts "Not Valid User Id"
    else
      puts "Successfully Deleted"
    end
  end
end

class Accountant

  def initialize(fname,lname,idp,emid,pass)
    @fname=fname
    @lname=lname
    @id=idp
    @emid=emid
    @pass=pass
  end

  def add
    f=File.write("Accountant.txt",[@emid,@pass,@id,@fname,@lname,"\n"].join("$"),mode:"a")
    puts "Successfully Added"  
  end

  def self.delete(usid)
    lines=File.readlines('Accountant.txt')
    lines1=lines.select{|s| !s.match /^#{usid}\$/}
    File.open("Accountant.txt", "w") do |f|
      f.puts(lines1)
    end
    if lines==lines1
      puts "Not Valid User Id"
    else
      puts "Successfully Deleted"
    end
  end
end

class Cashier
  
  def initialize(fname,lname,idp,emid,pass)
    @fname=fname
    @lname=lname
    @id=idp
    @emid=emid
    @pass=pass
  end

  def add
    f=File.write("Cashier.txt",[@emid,@pass,@id,@fname,@lname,"\n"].join("$"),mode:"a")
    puts "Successfully Added"
  end

  def self.delete(usid)
    lines=File.readlines('Customer.txt')
    lines1=lines.select{|s| !s.match /^#{usid}\$/}
    File.open("Customer.txt", "w") do |f|
      f.puts(lines1)
    end
    if lines==lines1
      puts "Not Valid User Id"
    else
      puts "Successfully Deleted"
    end
  end
end
