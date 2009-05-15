function num_to_words(n)
    local digits = {"one",     "two",       "three",    "four",     "five",
                    "six",     "seven",     "eight",    "nine"}
    local teens =  {"eleven",  "twelve",    "thirteen", "fourteen", "fifteen",
                    "sixteen", "seventeen", "eighteen", "nineteen"}
    local tens =   {"ten",     "twenty",    "thirty",   "forty",    "fifty",
                    "sixty",   "seventy",   "eighty",   "ninety"}
    local ret = ""
    if n == 1000 then return digits[1] .. "thousand" end
    if n >= 100 then
        local hundred = math.floor(n / 100)
        ret = ret .. digits[hundred] .. "hundred"
        n = n - hundred * 100
        if n > 0 then ret = ret .. "and" end
    end
    if n >= 10 then
        if n == 10 then return ret .. tens[1] end
        if n < 20 then
            return ret .. teens[n - 10]
        else
            local ten = math.floor(n / 10)
            ret = ret .. tens[ten]
            n = n - ten * 10
        end
    end
    if n >= 1 then
        ret = ret .. digits[n]
    end
    return ret
end

local sum = 0
for i = 1, 1000 do
    local text = num_to_words(i)
    print(i .. ": " .. text .. " (" .. text:len() .. ")")
    sum = sum + text:len()
end
print(sum)
