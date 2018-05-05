function evolve(path, rules)
        --takes in a string, a table of rules, and returns the evolved string
        local out = ""
        -- stuff here
        for i=1,string.len(path) do
                local step = path:sub(i,i)
                for j,rule in ipairs(rules) do
                        -- if a rule exists for the current step:
                        if (step == rule[1]) then
                                step = rule[2]

                        end
                end

                -- if no rule exists, insert step itself
                out = out .. step 
        end
        return out
end

function render(path,size,angle,iteration,rules) -- angle here is taken in as degrees
        
        for i=1,iteration do
                path = evolve(path,rules)
        end
        
        love.graphics.push()
                love.graphics.rotate(math.rad(-90))
                for i=1,string.len(path) do
                        step = path:sub(i,i)
                        if ((step == "F") or (step == "L") or (step == "R") or (step == "B")) then
                                love.graphics.line(0,0,size,0)
                                love.graphics.translate(size,0)
                        elseif ( (step == "f"))  then
                                love.graphics.translate(size,0)
                        elseif( (step == "+"))  then
                                love.graphics.rotate(math.rad(angle))
                        elseif( (step == "-"))  then
                                love.graphics.rotate(-math.rad(angle))
                        elseif( (step == "["))  then
                                love.graphics.push()
                        elseif( (step == "]"))  then
                                love.graphics.pop()
                        end
                end
        love.graphics.pop()
end