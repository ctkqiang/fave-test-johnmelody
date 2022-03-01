require 'sinatra'
require 'json'
require_relative 'controller/generate_pay_slip.rb'
require_relative 'controller/database.rb'

before do content_type :json end

get '/' do
    'Hello World!' 
end

post '/generate_payslip/' do
    name = params['employee_name']
    salary = params['annual_salary']

    employee = XYZCompany.new(name, salary)._employee

    { 
        "employee_name": "#{employee.name}",
        "gross_monthly_income": "#{employee.gross}",
        "monthly_income_tax": "#{employee.tax}",
        "net_monthly_income": "#{employee.net}",
    }.to_json

end

# Just in case if user use {get} request
get '/generate_payslip/:employee_name/:annual_salary' do |name, salary|

    employee = XYZCompany.new(name, salary)._employee

    { 
        "employee_name": "#{employee.name}",
        "gross_monthly_income": "#{employee.gross}",
        "monthly_income_tax": "#{employee.tax}",
        "net_monthly_income": "#{employee.net}",
    }.to_json

end

get '/list' do
    "#{Database.new("", "", "").showEmployees}"
end