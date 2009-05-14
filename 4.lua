local function is_palindrome(n)
    local first_half = string.sub(n, 1, string.len(n) / 2)
    local second_half = string.sub(n, -string.len(n) / 2)
    return first_half == string.reverse(second_half)
end

local prods = {}
for i = 100,999 do
    for j = 100,i do
        table.insert(prods, i * j)
    end
end
table.sort(prods, function(a, b) return a > b end)
for _, v in ipairs(prods) do
    if is_palindrome(v) then print(v) break end
end
