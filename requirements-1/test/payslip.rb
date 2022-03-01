require "minitest/autorun"
require_relative "../app.rb"
require_relative "../util/tax.rb"
require_relative "../util/util.rb"

class XYZTest < Minitest::Test
    def initialize
        self
    end

    def test()
        describe "Taxable eligiblitiy" do
            #### Alice ####
            it "Alice Taxable should be true" do
                puts Tax.new(XYZCompany.new("Alice", 60000)._employee.gross).isTaxable()
            end

            it "Alice Tax should be 20%" do
                puts Util.new.roundOff(Tax.new(XYZCompany.new("Alice", 60000)._employee.gross).getTaxableRate())
            end
            ###############

            #### Bob ####
            it "Bob Taxable should be true" do
                puts Tax.new(XYZCompany.new("Bob", 30000)._employee.gross).isTaxable()
            end

            it "Bob Tax should be 10%" do
                puts Util.new.roundOff(Tax.new(XYZCompany.new("Bob", 30000)._employee.gross).getTaxableRate())
            end
            ###############

            #### Terence ####
            it "Terence Taxable should be true" do
                puts Tax.new(XYZCompany.new("Terence", 120040.96)._employee.gross).isTaxable()
            end

            it "Terence Tax should be 30%" do
                puts Util.new.roundOff(Tax.new(XYZCompany.new("Terence", 120040.96)._employee.gross).getTaxableRate())
            end
            ###############

            #### Ted ####
            it "Ted Taxable should be true" do
                puts Tax.new(XYZCompany.new("Ted", 400001.23)._employee.gross).isTaxable()
            end

            it "Ted Tax should be 20%" do
                puts Util.new.roundOff(Tax.new(XYZCompany.new("Ted", 400001.23)._employee.gross).getTaxableRate())
            end
            ###############
        end
    end
end

XYZTest.new.test()