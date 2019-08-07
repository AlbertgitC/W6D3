class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, titile, salary, boss)
        @name, @title, @salary, @boss = name, titile, salary, boss
    end

    def bonus(num)
        bonus = salary * num
    end
end


class Manager < Employee
    attr_reader :employees

    def initialize(name, titile, salary, boss, employees = [])
        super(name, titile, salary, boss)
        @employees = employees
    end

    def bonus(num)
        return nil if employees.empty?
        bonus = 0
        employees.each do |employee|
            if employee.is_a?(Manager)
                bonus += employee.salary * num
                bonus += employee.bonus(num)
            else 
                bonus += employee.salary * num
            end
        end
        bonus
    end
end




shawna = Employee.new("Shawna", "TA", 12000, "Daren")
david = Employee.new("David", "TA", 10000, "Daren")
daren = Manager.new("Daren", "TA Manager", 78000, "Ned", [shawna, david])
ned = Manager.new("Ned", "Founder", 1000000, nil, [daren])

puts ned.bonus(5) # => 500_000
puts daren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000