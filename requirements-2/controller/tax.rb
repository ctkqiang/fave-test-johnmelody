class Tax
    """
    @amount:= (Integer) => Annual Salary
    @example:=
        tax = Tax.new({@amount})
        tax.{tax.class._methods_}
    """
    def initialize(amount)
        @rateError = "Error from `getTaxableRate()`: Failed to get rate."
        @amount = amount
    end

    """
    @getTaxableRate:= (Method) => Get `Annual` Taxable rate
    @assumed_formulae:= (Mathematics)
        ```
            let (x) be -> [Annual Income].
            let (y) be -> [Salary Bracket].
            let (z) be -> [Former Tax Value].
            let (t) be -> [Tax Rate].

            let (T) be -> [(t) / 100] => for conversion % to decimal.

            ∴ f(x) = [[(x - y) * T ] + z].
            ∴ f(x) / 12.
        ```
    @reference {url https://github.com/fave-interviews/johnmelodyme-20220223#readme}
    """
    def getTaxableRate()
        if @amount <= 20000
            return (((@amount - 0) * 0.0 ) + 0) / 12
        elsif @amount <= 40000
            return (((@amount - 20000) * 0.1 ) + 0) / 12
        elsif @amount <= 80000
            return (((@amount - 40000) * 0.2 ) + 2000) / 12
        elsif @amount <= 180000
            return (((@amount - 80000) * 0.3 ) + 10000) / 12
        elsif @amount > 180000
            return (((@amount - 180000) * 0.4 ) + 40000) / 12
        else
            raise Exception.new @rateError
        end
    end

    def isTaxable()
        if @amount <= 20000
            return false 
        end

        return true
    end

    def getNetSalary(tax)
        if self.isTaxable()
            return (@amount / 12) - tax
        end

        return @amount
    end
end