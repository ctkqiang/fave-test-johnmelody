require_relative "app.rb"

class Fave
    attr_accessor :name, :salary

    def initialize(name, salary)
        @@name = name
        @@salary = salary
    end

    def run()
        xyz = XYZCompany.new(@@name, @@salary).generate_monthly_payslip()
    end
end

fave = Fave.new(ARGV[0x0], ARGV[0x1])
fave.run()