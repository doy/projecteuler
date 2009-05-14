-- this will take ~6h to run... need efficiency!
function reversible(n)
    local revn = n:reverse()
    local str = tostring(n + revn)
    return not str:match("[02468]")
end

local sum = 0
for i = 1, 999999999 do
    if i % 10 ~= 0 and reversible(tostring(i)) then sum = sum + 1 end
end
print(sum)
