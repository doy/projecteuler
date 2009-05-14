function isprime(n)
    if n < 2 then return false end
    if n == 2 then return true end
    if math.fmod(n, 2) == 0 then return false end
    for i = 3, math.ceil(math.sqrt(n)), 2 do
        if math.fmod(n, i) == 0 then return false end
    end
    return true
end

local i = 2
local primes = 0
while true do
    if isprime(i) then
        primes = primes + 1
        if primes == 10001 then print(i); break end
    end
    i = i + 1
end
