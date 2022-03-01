require 'sqlite3'
require 'json'

require_relative '../util/util.rb'
require_relative '../model/result.rb'

class Database 
    attr_accessor :name, :annual, :tax

    def initialize(name, annual, tax)
        @@name = name
        @@annual = annual
        @@tax = tax

        @@util = Util.new

        @@databaseName = "employee.db"
        @@databaseTable = "EMPLOYEE"

        begin
            @@database = SQLite3::Database.open @@databaseName

            @@database.execute %{ 
                CREATE TABLE IF NOT EXISTS #{@@databaseTable} (
                    ID INTEGER PRIMARY KEY, 
                    EMPLOYEE_NAME TEXT, 
                    ANNUAL_SALARY TEXT, 
                    MONTHLY_INCOME_TAX TEXT, 
                    TIME_STAMP TEXT
                )
            }
        rescue TypeError
            puts "Type Error"
        end
    end

    def insertEmployee()
        @@database.execute %{ 
            INSERT INTO #{@@databaseTable} (
                EMPLOYEE_NAME, 
                ANNUAL_SALARY,
                MONTHLY_INCOME_TAX, 
                TIME_STAMP
            ) VALUES (?, ?, ?, ?) 
        } , @@name, @@annual, @@tax, @@util.getCurrentTimestamp
    end

    def showEmployees()
        result = { "salary_computations" => []}
        data = []
        length_row = 0

        @@database.execute %{SELECT * FROM #{@@databaseTable}} do |row|
            data.push(row)
            length_row = row.length
        end

        for i in 1..length_row do
            result['salary_computations'].push(
                { 
                    "time_stamp" => data[i][4], 
                    "employee_name" => data[i][1],
                    "annual_salary" => data[i][2],
                    "monthly_income_tax" => data[i][3] 
                }
            )          
        end

        result.to_json
    end
end