FROM ruby:2.5.5

RUN apt update

COPY Gemfile ./app

COPY . /app

RUN cd /app && bundle install
CMD ruby /app/generate_monthly_payslip.rb "Ren" 60000