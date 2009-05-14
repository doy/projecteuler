-- only valid when n > 1
function num_factors(n)
    local ret = 2
    local test = 2
    local limit = math.sqrt(n)
    while test < limit do
        if n % test == 0 then
            ret = ret + 2
        end
        test = test + 1
    end
    if limit == math.floor(limit) then ret = ret + 1 end
    return ret
end

generate_triangle = coroutine.wrap(function()
    local num = 0
    local add = 1
    while true do
        num = num + add
        add = add + 1
        coroutine.yield(num)
    end
end)

while true do
    local n = generate_triangle()
    local nn = num_factors(n)
    print(n .. ": " .. nn)
    if nn > 500 then break end
end
