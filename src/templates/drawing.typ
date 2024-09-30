#import "@preview/cetz:0.2.2"

#import cetz.draw: *
// DRAWABLE VECTOR
#let dvec(start, end, label: none, padding: 2pt, anchor: "center", rev: false, color: black, shrink: 1pt, thickness: 2pt, shadow_color: none, rotate_label: false, mark: (end: ">"), label_fill: white, anchor_at:50%) = {
  hide(line(start, end, on-layer: -2, name: "shadow"))
  hide(line(end, start, on-layer: -2, name: "shadow-rev"))
  line((name: "shadow", anchor: shrink), (name: "shadow-rev", anchor: shrink), mark: mark, on-layer: -1, name: "vec", stroke: (paint: color, thickness: thickness))
  let clabel = [#text(color, label)]
  let rangle = 0deg
  if rotate_label == true and rev == false {
    rangle = "vec.end"
  }
  if rotate_label == true and rev == true {
    rangle = "vec.start"
  }

  if label != none {
    if not rev {
      content((name:"shadow", anchor:anchor_at), clabel, anchor: anchor,offset: 5pt, angle: rangle, padding: padding, fill: label_fill, frame: "rect", stroke: none)
    } else {
      content((name:"shadow-rev", anchor:anchor_at), clabel, anchor: anchor,offset: 5pt, angle: rangle, padding: padding, fill: label_fill, frame: "rect", stroke: none)
    }
  }
}

#let dpoint(coords, label: none, anchor: "north", radius: 2pt, color: black) = {
  circle(coords, radius: radius, fill: color)
  content(coords, anchor: anchor, padding: .3)[#label]
}

#let dangle3p(p0, p1, p2, right: false, label: none, radius: 3, label-radius: 110%, color: black, thickness: 1pt, on-layer: 0) = {
  hide(line(p0, p1, stroke: (paint: red, thickness: 1pt), name: "l0"))
  hide(line(p0, p2, stroke: (paint: blue, thickness: 1pt), name: "l1"))
  if not right {
    cetz.angle.angle("l0.start", "l0.end", "l1.end", label: text(color)[#label], label-radius: label-radius, mark: (end: ">"), radius: radius, stroke: (paint: color, thickness: thickness), on-layer: on-layer)
  } else {
    cetz.angle.right-angle("l0.start", "l0.end", "l1.end", radius: radius, label: text(color)[#label], stroke: (paint: color, thickness: thickness), on-layer: on-layer)
  }
}

// ARRAY SUBSTRACTION
#let arrmul(a0, a1) = {
  let out = ()
  for (v0, v1) in a0.zip(a1) {
    out.push(v0 * v1)
  }
  out
}

// ARRAY SUBSTRACTION
#let arradd(a0, a1) = {
  let out = ()
  for (v0, v1) in a0.zip(a1) {
    out.push(v0 + v1)
  }
  out
}

#let arrnumprod(a, num) = {
  let out = ()
  for v in a {
    out.push(v * num)
  }
  out
}


// ARRAY SUBSTRACTION
#let arrsub(a0, a1) = {
  let out = ()
  for (v0, v1) in a0.zip(a1) {
    out.push(v0 - v1)
  }
  out
}

#let anorm(a) = {
  let out = 0
  for v in a {
    out += v * v
  }
  calc.sqrt(out)
}

#let normalize(a) = {
  let norm = anorm(a)
  a.map(v => v / norm)
}

#let rotmat2D(angle) = {
  let c = calc.cos(angle)
  let s = calc.sin(angle)
  ((c, -s), (s, c))
}

#let dispvcol(a, basis: 0) = {
  let ma = a.map(v => ($#v$,))
  let m = math.mat(delim: "[", ..ma)
  $attach(#m, br: #str(basis))$
}

#let arotz90(a, inv: false) = {
  let k = if inv {
    1
  } else {
    -1
  }
  (k * a.at(1), -k * a.at(0))
}

#let arrcrossprod(a0, a1) = {
  let out = (
    a0.at(1) * a1.at(2) - a0.at(2) * a1.at(1),
    a0.at(2) * a1.at(0) - a0.at(0) * a1.at(2),
    a0.at(0) * a1.at(1) - a0.at(1) * a1.at(0),
  )
  out
}

#let arrdotprod(a0, a1) = {
  let out = 0
  for (v0, v1) in a0.zip(a1) {
    out += v0 * v1
  }
  out
}

#let dimension_line(start, end, inv: false, label: none, offs: 2, ratio: 90%) = {
  let AB = arrsub(end, start)
  let u = normalize(AB)
  let v = arotz90(u, inv: inv)
  let v2 = arrnumprod(v, offs)
  let C = arradd(end, v2)
  let D = arradd(start, v2)
  line(start, D, stroke: (paint: black, thickness: 0.5pt), name: "l0")
  line(end, C, stroke: (paint: black, thickness: 0.5pt), name: "l1")
  dvec((name: "l0", anchor: ratio), (name: "l1", anchor: ratio), label: label, color: black, shrink: 1pt, rotate_label: true, mark: (end: "straight", start: "straight"), thickness: 1pt)
}

#let mvec(what) = $accent(what, ->)$