# Loss
Deterministic Context-Free L system implementation to draw fractal curves and axial plants. Made with love, for löve.

## Introduction 
- L-Systems, short for Lindenmayer Systems, is a formal contextualization of naturally recurring constructs (ex. fractals and plants) under the light of formal language and automata theory.
- Wikipedia introduces excellent examples on the topic: https://en.wikipedia.org/wiki/L-system
- Implemented on version 0.9.1 of the LÖVE engine: https://love2d.org/
- A Python implementation written in Turtle is also provided.
## Example Renders
- Checkout the Python script attached to this repository
- Finished products will be coming soon!
## Example L Systems by Author
- Lightning
```
lightning = {}
lightning.path = "F" -- axiom
lightning.size = 15
lightning.angle = 25
lightning.rules = {}
lightning.rules["F"] = "FL[++F][-FF]"
lightning.rules["L"] = "L+F-F[L]"

ligntning = L:init(lightning.path,lightning.size,lightning.angle,lightning.rules,4)
```
- A sample tree
```
tree = {}
tree.path = "Ff"
tree.maxorder = 4
tree.angle = 18
tree.rules = {}
tree.rules["F"] = "F[+[F]+[Bf]]-B"
tree.rules["B"] = "BFB[--B]+Bf"
-- call L:init() with these values in mind
```
## Usage
- `git clone https://github.com/jryzkns/Loss.git`
- Copy and paste `L.lua` in the directory containing the target love script.
- Append `local L = require("L")` in the love script where drawing will be called.
- Call `L:init()` and initialize values inside `love.load().`
- Call `L:render()` to draw the construct.
- To introduce new symbols into the alphabet, write the following:
* For straight line drawings, append `L.extradrawchars = L.extradrawchars .. "new symbol"`
* For symbols with new functionalities, the code is as follows:
```
L:drawtable["new symbol"] = function()
    -function details
end
```
### The Alphabet:
- The built-in alphabet consists of the following symbols:
- `F`,`B`,`L`,`R`,`f`,`+`,`-`,`[`,`]`
- `F`,`B`,`L`,`R` all correspond to drawing a straight line. This semantic distinction is to use the formation rules.
- `f` denotes travelling as if drawing a line without producing one.
- `+`,`-` denote rotating the current reference point in the positive or negative direction. The extent of the rotation depends on the `Angle` variable.
- `[`,`]` denotes the stack operation, push or pop, which operates on the current state of the reference point. This symbol is used to branch the behaviour.
### Initialize `Axiom`, `Rules`, `Iterations`, `Angle`, And `Linesize` As Variables
- `Axiom` is a string denoting the initial state of the system.
- `Rules` are tabulated formation rules, initialized as an empty table. The key is the original symbol in the alphabet.
- Formation rules are tabulated. If the rules states that a -> b, it is written, rules["a"] = "b".
- `Iterations` are integers denoting how many iterations the system will evolve.
- `Angle` is a value in degrees, which determines how much each call will turn the construct.
- `Linesize` is the length of the line. Use a small test value as drawings may enlarge quickly!
### Drawing
- Call L:render() to start drawing. Set `love.graphics.translate()` to the starting point and call `L:render()`.

## A Side Note
- Rendering L system constructs may exceed 100 calls, which is expensive if it is called on every flip. 
- Instead, draw to a canvas on initialization and draw the canvas on each flip.

jryzkns 2018
