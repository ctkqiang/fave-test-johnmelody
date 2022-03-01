class Util
    def roundOff(input)
        return input.round(0x2)
    end

    def removeSpecialChar(input)
        return input.gsub(/[^a-zA-Z0-9\-.]/,"")
    end

    def salaryFormater(input)
        if input.instance_of? String
            return self.removeSpecialChar(input).to_f.truncate()
        end

        if input.instance_of? Integer
            return input.to_f.truncate()
        end

    end
end