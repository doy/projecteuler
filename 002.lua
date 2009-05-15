local function memoize(fn)
    local t = {}
    return function(x)
        local y = t[x]
        if y == nil then y = fn(x); t[x] = y end
        return y
    end
end

fib = memoize(function(n)
    if n < 3 then return 1 end
    return fib(n - 1) + fib(n - 2)
end)

local root5 = math.sqrt(5)
local phi = (1 + root5)/2
local function fib2(n)
    return math.floor((phi^n-(1-phi)^n)/root5+0.5)
end

local sum = 0
local i = 0
while true do
    i = i + 1
    local n = fib(i)
    if n > 1000000 then break end
    if n % 2 == 0 then sum = sum + n end
end

print(sum)
