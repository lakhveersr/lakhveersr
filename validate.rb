module Validate
  def self.customer (usid,pass)
    f=File.open("Customer.txt","a+")
    f.each do |line|
      if line.match /^#{usid}/
        return "Success" if line.match /^#{usid}\$#{pass}\$/
      end
    end
    return "fail"
  end
  
  def self.accountant(usid,pass)
    f=File.open("Accountant.txt","a+")
    f.each do |line|
      if line.match /^#{usid}/
        return "Success" if line.match /^#{usid}\$#{pass}\$/
      end
    end
    return "fail"
  end
 
  def self.admin(usid,pass)
    f=File.open("Admin.txt","a+")
    f.each do |line|
      if line.match /^#{usid}/
        return "Success" if line.match /^#{usid}\$#{pass}\$/
      end
    end
    return "fail"
  end

  def self.cashier(usid,pass)
    f=File.open("Cashier.txt","a+")
    f.each do |line|
      if line.match /^#{usid}/
        return "Success" if line.match /^#{usid}\$#{pass}\$/
      end
    end
    return "fail"
  end
end
