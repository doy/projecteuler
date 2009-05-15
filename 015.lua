function combinations(n, r)
    local numerator = 1
    local denominator = 1
    for i = n, n - r + 1, -1 do
        numerator = numerator * i
    end
    for i = r, 1, -1 do
        denominator = denominator * i
    end
    return numerator / denominator
end

print(combinations(40, 20))
