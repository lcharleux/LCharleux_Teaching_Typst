#import "@preview/cetz:0.2.2"

#import cetz.draw: *
// DRAWABLE VECTOR
#let dvec(start, end, label: none, padding: 4pt, anchor: "center", rev: false, color: black, shrink: 1pt, thickness: 2pt, shadow_color: none, rotate_label: true) = {
  hide(line(start, end, on-layer: -2, name: "shadow"))
  hide(line(end, start, on-layer: -2, name: "shadow-rev"))
  line((name: "shadow", anchor: shrink), (name: "shadow-rev", anchor: shrink), mark: (end: ">"), on-layer: -1, name: "vec", stroke: (paint: color, thickness: thickness))
  let clabel = [#text(color, label)]
  let rangle = 0deg
  if rotate_label == true and rev == false {
    rangle = "vec.end"
  } 
  if rotate_label == true and rev == true {
    rangle = "vec.start"
  }
  
  
  if not rev {
    content("vec.mid", clabel, offset: 5pt, angle: rangle, padding: padding, anchor: anchor, fill: white, frame: "rect", stroke: none)
  } else {
    content("vec.mid", clabel, offset: 5pt, angle: rangle, padding: padding, anchor: anchor, fill: white, frame: "rect", stroke: none)
  }
}

#let dpoint(coords, label: none, anchor: "north", radius: 2pt, color: black) = {
  circle(coords, radius: radius, fill: color)
  content(coords, anchor: anchor, padding: .3)[#label]
}

#let dangle3p(p0, p1, p2, right: false, label: none, radius: 3, label-radius: 110%, color: black, thickness:1pt, on-layer:0) = {
  hide(line(p0, p1, stroke: (paint: red, thickness: 1pt), name: "l0"))
  hide(line(p0, p2, stroke: (paint: blue, thickness: 1pt), name: "l1"))
  if not right {
    cetz.angle.angle("l0.start", "l0.end", "l1.end", label: text(color)[#label], label-radius: label-radius, mark: (end: ">"), radius: radius, stroke: (paint: color, thickness: thickness), on-layer: on-layer)
  } else {
    cetz.angle.right-angle("l0.start", "l0.end", "l1.end", radius: radius, label: text(color)[#label], stroke: (paint: color, thickness: thickness), on-layer: on-layer)
  }
}