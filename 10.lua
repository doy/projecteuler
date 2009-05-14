function isprime(n)
    if n < 2 then return false end
    if n == 2 then return true end
    if math.fmod(n, 2) == 0 then return false end
    for i = 3, math.ceil(math.sqrt(n)), 2 do
        if math.fmod(n, i) == 0 then return false end
    end
    return true
end

local i = 3
local sum = 2
while true do
    if i >= 1000000 then break end
    if isprime(i) then
        if sum + i < sum then print("overflow") end
        sum = sum + i
    end
    i = i + 2
end
print(sum)
