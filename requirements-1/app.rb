require 'json'

require_relative 'model/employee.rb'
require_relative 'util/util.rb'
require_relative 'util/tax.rb'

class XYZCompany
    attr_accessor :name, :amount
    """
    Monthly Payslip for: Ren
    Gross Monthly Income: $5000.00
    Monthly Income Tax: $500.00
    Net Monthly Income: $4500.00
    """
    def initialize(name, amount)
        @@name = name
        @@amount = amount

        @@employee = Employee.new
        @@util = Util.new
    end
    
    def self.generate_monthly_payslip()
        self
    end

    def _employee()
        @@employee.name = @@name
        @@employee.gross = @@util.salaryFormater(@@amount).to_f.truncate(0x2)
        @@employee.tax = Tax.new(@@employee.gross).getTaxableRate().to_f.truncate(0x2)
        @@employee.net = Tax.new(@@employee.gross).getNetSalary(@@employee.tax).to_f.truncate(0x2)

        return @@employee
    end
    
    def generate_monthly_payslip()
        self.class.generate_monthly_payslip
        
        puts "\n"
        puts "Monthly Payslip for: #{self._employee.name}"
        puts "Gross Monthly Income: #{self._employee.gross}"
        puts "Monthly Income Tax: #{self._employee.tax}"
        puts "Net Monthly Income: #{self._employee.net}"
        puts "\n"
    end
end
