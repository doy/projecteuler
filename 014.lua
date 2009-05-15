function collatz(n)
    local sum = 1
    while true do
        if n == 1 then break end
        if n % 2 == 0 then n = n / 2
        else n = n * 3 + 1 end
        sum = sum + 1
    end
    return sum
end

local max = 0
local maxnum = 0
for i = 1, 999999 do
    local sum = collatz(i)
    print(i .. ": " .. sum)
    if sum > max then max = sum; maxnum = i end
end
print("--------")
print(maxnum .. ": " .. max)
