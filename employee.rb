require "byebug"

class Employee
    
    attr_reader :name, :title, :salary, :boss 
    def initialize(name, title, salary, boss = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        
    end

    def bonus(multiplier)
        sum = 0

        if title == "TA"
            return @salary * multiplier
        elsif title == "TA Manager"
            @direct_employees.each do |employee|
            sum += employee.salary
            end
            return sum * multiplier
        else
            
            @direct_employees.each do |manager|
                manager.direct_employees.each do |employee|
                    sum += employee.salary
                end
                sum += manager.salary
            end
            return sum * multiplier
        end
    end

end 

class Manager < Employee
    attr_reader :direct_employees
    def initialize(name, title, salary, boss = nil)
      super 
      @direct_employees = [] 
    end

    def add_employee(employee)
      @direct_employees << employee
    end
    

end


p david = Employee.new("David", "TA", 10000, "Darren")
p shawna = Employee.new("Shawna", "TA", 12000, "Darren")
p darren = Manager.new("Darren", "TA Manager", 78000, "Ned")
p ned = Manager.new("Ned", "Founder", 1000000)
darren.add_employee(shawna)
darren.add_employee(david)
ned.add_employee(darren)
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000