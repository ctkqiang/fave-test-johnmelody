class Result
    attr_accessor :name, :gross, :tax, :net

    def initialize(name, gross, tax, net)
        @name = name
        @gross = gross
        @tax = tax
        @net = net
    end

    def toJson
        { name => @name, gross => @gross, tax => @tax, net => @net }
    end
end