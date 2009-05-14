local triangle_graph = {
}

--[[
http://en.wikipedia.org/wiki/Graph_coloring#Computing_the_chromatic_polynomial
]]
function chromatic_polynomial(g, t)
    local edge_start
    for v1, edges in ipairs(g) do
        for v2index, v2 in ipairs(edges) do
            if v1 == v2 then return 0 end
            if not edge_start then edge_start = v1 end
        end
    end

    if edge_start == nil then return t^#g end

    local edge_end = table.remove(g[edge_start])
    local edge_removed = chromatic_polynomial(g, t)
    table.insert(g[edge_start], edge_end)

    -- need to contract the edge here
    local edge_contracted = chromatic_polynomial(g, t)
    -- and then fix it back up

    return edge_removed - edge_contracted
end
