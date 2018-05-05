# Loss
Deterministic Context-Free L system implementation for drawing fractal curves and axial plants. Made with love, for löve.

## What is this? 
-L-Systems are short for Lindenmayer Systems. It is a formal contextualization of naturally recurring constructs (ex. fractals and plants) under the light of formal language and automata theory.
-Wikipedia has some great examples on the matter: https://en.wikipedia.org/wiki/L-system
-The implementation is done on version 0.9.1 of the LÖVE engine:https://love2d.org/
-A python implementation written in turtle is provided as well
## Example renders
-Check out the python script attached to this repository
-Also some finished products will be coming soon!
## Usage
- `git clone https://github.com/jryzkns/Loss.git`
- Take `L.lua` and place it in the directory containing the love script you will be working on
- Put `require("L")` in the love script where drawing will be called.
### the alphabet:
- the built-in alphabet contains the following symbols:
- `F`,`B`,`L`,`R`,`f`,`+`,`-`,`[`,`]`
- `F`,`B`,`L`,`R` all correspond to drawing a straight line. The distinction is made for semantic purposes in using the formation rules
- `f` denotes travelling as if drawing a line but doesn't actually draw a line
- `+`,`-` are rotating the current reference point in either the positive direction of the negative direction. The extent of the rotation depends on the `Angle` variable
- `[`,`]` are stack operations pushing or popping the current state of the reference point onto a stack. It is mainly used for branching behaviour
### initialize `Axiom`, `Rules`, `Iterations`, `Angle`, and `Linesize` as variables
- `Axiom` is a string denoting the initial state of the system.
- `Rules` should be initialized as an empty table, and then append individual formation rules. 
- Formation rules are tables as well. if a formation rule states that a -> b, then it will be {"a","b"}
- `Iterations` is an integer denoting how many iterations the system will evolve
- `Angle` determines how much each call will turn, it is in DEGREES.
- `Linesize` is how long each line is going to be. Beware that these drawings can become big really quickly, so use a small value when testing!
### drawing
- render() is the drawing call to make. `love.graphics.translate()` to the point where you want to begin then call render.
- the parameters are passed in in this order: `render(path,size,angle,iteration,rules)`

## a note on usage
- rendering L system constructs can take up to over 100 calls easily, which is very expensive if it is called on every flip. 
- It is recommended to draw to a canvas at initialization and then draw the canvas at each flip instead.

jryzkns 2018
