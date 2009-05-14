local num = 317584931803
local test = 3
while true do
    if num % test == 0 then num = num / test
    else test = test + 2 end
    if test > math.sqrt(num) then break end
end
print(num)
