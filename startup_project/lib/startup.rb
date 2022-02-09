require "employee"
class Startup

    attr_accessor = :name, :funding, :salaries
    def initialize (name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries 
        @employees = []
    end 

    def name 
        return @name
    end 

    def funding 
        return @funding 
    end 
    def salaries 
        return @salaries
    end 
    def employees
        return @employees
    end 

    def valid_title?(title)
        if @salaries.include?(title)
            return true 
        else
            return false
        end 
    end 

    def >(other_startup)
        if self.funding > other_startup.funding 
            return true 
        else 
            return false 
        end
    end

    def hire(employee_name, title)
        if valid_title?(title)
            
            @employees << Employee.new(employee_name, title)
        else 
            raise "Error 1: Title is invalid."
        end
    end 

    def size
        return @employees.length 
    end

    def pay_employee(empy)
        if @funding > @salaries[empy.title]
            empy.pay(@salaries[empy.title])
            @funding -= @salaries[empy.title]
        else
            raise "Error 2: Not enough funds."
        end
    end

    def payday 
        @employees.each do |ele|
            pay_employee(ele)
        end
    end

    def average_salary 
        sum = 0
        @employees.each do |emply|
            sum += salaries[emply.title]
        end
        

        return sum/employees.length
    end

    def close 
        @employees = []
        @funding = 0
    end

    def acquire (startup_2)
        @funding += startup_2.funding
        startup_2.salaries.each do |k,v|
            if !@salaries.has_key?(k)
                @salaries[k] = v
            else 
                next 
            end
        end
        @employees += startup_2.employees
        startup_2.close
    end






end
