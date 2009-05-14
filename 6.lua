local function sum_of_squares(n)
    local total = 0
    for i = 1, n do
        total = total + i^2
    end
    return total
end

local function square_of_sum(n)
    return n^2*(n+1)^2/4
end

print(square_of_sum(100) - sum_of_squares(100))
