class Employee
    attr_accessor :name, :title 
    

    def initialize(name, title)
        @earnings = 0
        @name = name
        @title = title 
    end

    def pay (num)
        @earnings += num
    end
end
