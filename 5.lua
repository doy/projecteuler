local max_factors = {}
for _, prime in ipairs({2, 3, 5, 7, 11, 13, 17, 19}) do
    for i = prime, 20, prime do
        local num_fact = 0
        local tmp = i
        while i % prime == 0 do
            num_fact = num_fact + 1
            i = i / prime
        end
        if num_fact > (max_factors[prime] or 0) then
            max_factors[prime] = num_fact
        end
    end
end

local total = 1
for prime, power in pairs(max_factors) do
    total = total * prime^power
end

print(total)
