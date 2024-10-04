#import "@preview/cetz:0.2.2"

#import cetz.draw: *


#let fonc = {
circle((0,0), name: "circle2")
// Draw a smaller red circle at "circle"'s east anchor
fill(red)
stroke(black)
circle("circle2.east", radius: 0.3)
circle((name:"circle2", anchor:30deg), radius: 0.3, stroke: black, fill: red)
}

#cetz.canvas({
fonc
})

#calc.rem(9, 2)