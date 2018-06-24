-- L
-- jryzkns 2018

-- jryzkns 2018
-- TODO: stochastic formulations: rules table have functions that return strings instead of just a string

L = {}

L.path,L.size, L.angle, L.rules = "", 0, 0, {}

L.drawtable = {}

L.drawtable["F"] = function()
        love.graphics.line(0,0,L.size,0)
        love.graphics.translate(L.size,0)
end

L.extradrawchars = "SLRB"
for i=1,string.len(L.extradrawchars) do L.drawtable[L.extradrawchars:sub(i,i)] = L.drawtable["F"] end

L.drawtable["+"] = function() love.graphics.rotate(math.rad(L.angle)) end
L.drawtable["-"] = function() love.graphics.rotate(-math.rad(L.angle)) end
L.drawtable["["] = function() love.graphics.push() end
L.drawtable["]"] = function() love.graphics.pop() end

L.drawtable["f"] = function() -- a flower
        local r,g,b = love.graphics.getColor()
        love.graphics.setColor(223/255,102/255,255/255)
        love.graphics.circle("fill",0,0,L.size*0.5)
        love.graphics.setColor(r,g,b)
end

function L:init(path,size,angle,rules,iteration)
        L.path,L.size,L.angle,L.rules,L.iteration = path,size,angle,rules,iteration
        for i=1,iteration do path = L:evolve() end
end

function L:evolve()
        --takes in a string, a table of rules, and returns the evolved string
        local out = ""
        for i=1,string.len(L.path) do
                local step = L.path:sub(i,i)
                
                -- if a rule exists for the current step:
                if L.rules[step] ~= nil then
                        step = L.rules[step]
                end
                
                -- if no rule exists, insert step itself
                out = out .. step 
        end
        return out
 
end

function L:draw()
        love.graphics.push()
                for i=1,string.len(L.path) do L.drawtable[L.path:sub(i,i)]() end
        love.graphics.pop()
end

return L
