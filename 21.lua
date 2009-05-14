function d(n)
    if n < 2 then return 0 end
    local ret = 1
    local test = 2
    local limit = math.sqrt(n)
    while test < limit do
        if n % test == 0 then
            ret = ret + test + n / test
        end
        test = test + 1
    end
    if limit == math.floor(limit) then ret = ret + limit end
    return ret
end

local sum = 0
for i = 1, 9999 do
    local di = d(i)
    if d(di) == i and i ~= di then
        print(i .. ": " .. di)
        sum = sum + i
    end
end
print(sum)
