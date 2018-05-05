-- L system example file
-- jryzkns 2018

require("L")

function love.load()
        love.window.setTitle("example usage of L system - jryzkns 2018")

        path = "F" -- axiom
        angle = 15
        rules = {}
        rules[1] = {"F","F[+[F]+[B]]-B"}
        rules[2] = {"B","BF[-B]B+B"}
        iterations = 4
        linesize = 10
end

function love.draw()
        love.graphics.translate(300,550)
        render(path,linesize,angle,iterations,rules)

end