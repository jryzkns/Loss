import turtle
import sys

def draw(path,coord=(0,0)):
        pen = turtle.Turtle()
        pen.lt(90)
        pen.ht()
        pen.pu()
        pen.goto(coord)
        pen.pd()
        pen.speed(0)
        states = []
        for i in range(len(path)):
                
                        ins = path[i]

                        if (ins == "F") or (ins == "L") or (ins == "R"):
                                pen.fd(f)
                        elif ins == "f":
                                pen.pu()
                                pen.fd(f)
                                pen.pd()
                        elif ins == "+":
                                pen.lt(delt)
                        elif ins == "-":
                                pen.rt(delt)
                        elif ins == "[":
                                states.append([pen.pos(),pen.heading()])
                        elif ins == "]":
                                pen.pu()
                                pen.goto(states[-1][0])
                                pen.setheading(states[-1][1])
                                pen.pd()
                                states.pop()


def evolve(path,rules):
        newpath = ""

        ##look at every character in the path string
        for ins in path:
                newins = ins

                ##checks for a rule that applys to it
                for rule in rules:

                        ##if rule applies, evolve
                        if rule[0] == newins:
                                newins = str(rule[1])

                newpath += newins                

        return newpath

#TOP:

if len(sys.argv) != 4:
        print("usage: python Lsys.py <linelen> <angle> <order>")
        sys.exit()

f = float(sys.argv[1])
delt = float(sys.argv[2])

rules = []

# #hex gosper angle = 60
# path = "L"
# rules.append(["L","L+R++R-L--LL-R+"])
# rules.append(["R","-L+RR++R+L--L-R"])

# #tree a angle = 25.7
# path = "F"
# rules.append(["F","F[+F]F[-F]F"])

# #tree b = 20
# path = "F"
# rules.append(["F","F[+F]F[-F]F"])

# #tree c
# path = "F"
# rules.append(["F","FF-[-F+F+F]+[+F-F-F]"])

#tree noderewriting 1
path = "X"
rules.append(["X","F[+X]F[-X]+X"])
rules.append(["F","FF"])


for i in range(int(sys.argv[3])):
        path = evolve(path, rules)

draw(path)

turtle.mainloop()