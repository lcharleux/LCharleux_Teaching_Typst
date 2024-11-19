// TEMPLATE IMPORT
#import "../templates/conf.typ": conf, todo, comment, idea, note, important
#import "../templates/drawing.typ": dvec, dpoint, dangle3p, dimension_line, arotz90, arrnumprod, arrsub, anorm, normalize, rotmat2D, dispvcol, arradd, mvec, arrcrossprod, arrdotprod, torseur1, torseur2, torseur6, part_label
#import "@preview/unify:0.6.0": num, qty, numrange, qtyrange
#import "@preview/cetz:0.2.2"
#import "@preview/showybox:2.0.1": showybox
#import "@preview/chic-hdr:0.4.0": *
#import cetz.draw: *
// #set math.equation(numbering: "(1)")

// DOCUMENT SETUP
#let course = "Demo - Sandbox"
#let block = "Expérimentations"
#let section = "PAC"
#let teacher = "Ludovic Charleux"
#let email = "ludovic.charleux@univ-smb.fr"


#show: doc => conf(
  course: course,
  block: block,
  section: section,
  teacher: teacher,
  email: email,
  doc,
)


= Calculs sur les vecteurs


#let a0 = (1, 1, 0)
#let a1 = (6, 5, 4)

On peut afficher des vecteus formels: $ #dispvcol(($theta$, $alpha$, 0)) $

On peut calculer des choses avec:$ a_0 = dispvcol(#a0) $ Et: $ a_1 = dispvcol(#a1) $

On peut additionner les vecteurs:

$ a_0 + a_1 = dispvcol(arradd(a0, a1)) $

Et les soustraire:

$ a_0 - a_1 = dispvcol(arrsub(a0, a1)) $

Ou normaliser le vecteur #mvec($a_0$) en #mvec($v_0$):

$ mvec(v) = dispvcol(normalize(#a0)) $

#arrnumprod(a0, 10)

= Dessins avancés




#align(center)[

  #cetz.canvas({
    let A = (0, 0)
    let B = (5, 5)
    dpoint(A, label: "A", anchor: "south")
    dpoint(B, label: "B", anchor: "south")
    dimension_line(A, B, label: [$L$], inv: true, offs: 2, ratio: 90%)
    // let label = [$L$]
    // let inv = true
    // let offs =  2
    // let ratio = 90%

    // let offset = 10pt
    // line(A, B, stroke: (paint: blue, thickness: 1pt))
    // dpoint(A, label: "A", anchor: "south")
    // dpoint(B, label: "B", anchor: "south")
    // let AB = arrsub(B, A)
    // let u = normalize(AB)
    // let v = arotz90(u, inv:inv)
    // let v2 = arrnumprod(v, offs)
    // let C = arradd(B, v2)
    // let D = arradd(A, v2)
    // line(A, D, stroke: (paint: black, thickness: 0.5pt), name: "l0")
    // line(B, C, stroke: (paint: black, thickness: 0.5pt), name: "l1")
    // // dpoint(C, label: "C", anchor: "north")
    // dvec((name: "l0", anchor: ratio), (name: "l1", anchor: ratio) , label: label, color: black, shrink: 1pt, rotate_label: true, mark: (end: "straight", start: "straight"), thickness: 1pt)

  })
]


= Gregoire

= Classes

#let data = ("name": "tutu", "label": "hello")

#data.name

#(
  for i in (1, 2, 3) {
    str(i)
  }
)

= Repères en 3D

#align(center)[
  #cetz.canvas({
    ortho(
    x: 30deg,
    y: 30deg,
    // z: 0deg,
    {
      let O0 = (0, 0, 0)
      let x = (3, 0, 0)
      let y = (0, 3, 0)
      let z = (0, 0, 3)
      let M = (10, 5, 1)
      catmull((12,3, 1), (10,6,1), (8,4,1), (10,2,1), tension: .4, stroke: black, close:true, name:"potato", fill: yellow.lighten(50%))
      content((name:"potato", anchor:90%), anchor: "north", padding: .3)[$(S_1)$]
      dpoint(O0, label: [$O_0$], anchor: "north")
      dvec(O0, x, label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O0, y, label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O0, z, label: [$#mvec[z]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O0, M, label: [$#mvec[$O_0M$]$], color: blue, shrink: 4pt, rotate_label: false)
      dpoint(O0, label: [$O_0$], anchor: "north")
      dpoint(M, label: [$M$], anchor: "north-west", color:red)
    },
  )
  })
]

= Torseurs




$ torseur6(rx: F_y , mz: L F_y  ) $




$ torseur2(R: #mvec[F]_y , p:A ) $



$ torseur1(T: T_0 ) $

= RDM


#let load(x) = 1 + x - calc.pow(x, 2) / 8

#align(center)[
  #cetz.canvas({
    ortho(
    x: 30deg,
    y: 30deg,
    // z: 0deg,
    {
      let L=10
      let Nv= 20
      let O0 = (0, 0, 0)
      let A = (L, 0, 0)
      let x = (3, 0, 0)
      let y = (0, 3, 0)
      let z = (0, 0, 3)
      dpoint(O0, label: [$O_0$], anchor: "north")
      dpoint(A, label: [$A$], anchor: "west")
      line(O0, A, stroke: (paint: black, thickness: 1pt))
      for i in range(Nv+1) {
        let x = L* i / Nv
        let y = load(x)
        let B = (x, 0, 0)
        let C = (x, y, 0)
        // dpoint(B, label: [$B B_#str(i)$], anchor: "north")
        dvec(C, B, label: none, color: red, shrink: 0, rotate_label: false, thickness: 1pt)

      }
      for i in range(Nv) {
        let x = L* i / Nv
        let x2 = L* (i+1) / Nv
        let y = load(x)
        let y2 = load(x2)
        let P = (x, y, 0)
        let P2 = (x2, y2, 0)
        // dpoint(B, label: [$B B_#str(i)$], anchor: "north")
        line(P, P2, stroke: (paint: red, thickness: 1pt))

      }
      dvec(O0, x, label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt, anchor:"north", label_fill:none)
      dvec(O0, y, label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O0, z, label: [$#mvec[z]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)

    },
  )
  })
]

= Champ de moment d'un torseur

#align(center)[
  #cetz.canvas({
    ortho(
    // x: 30deg,
    // y: 30deg,
    // z: 0deg,
    {
      let R = (0, 0, 7)
      let MO = (0, 0, 20)
      let O0 = (0, 0, 0)
      let nr = 10
      let ntheta = 4
      let rmax = 5
      let rmin = 1
      let mscale = .1

      for i in range(nr) {
        let r = rmin + (rmax - rmin) * i / nr
        for j in range(ntheta){
          let theta = 2 * calc.pi * j / ntheta
          let P = (r * calc.cos(theta), r * calc.sin(theta), 0.)
          dpoint(P, color: black)
          let PO0 = arrsub(O0, P)
          let M = arrnumprod(arradd(arrcrossprod(PO0, R), MO), mscale)
          dvec(P, arradd(M, P), color: red, shrink: 0, rotate_label: false, thickness: 1pt)


        }

      }
      dvec(O0, R, label: [$#mvec[R]$], color: blue, shrink: 0pt, rotate_label: false, thickness: .5pt)
      dpoint(O0, label: none, anchor: "north")
      if MO.at(2) != 0 {
        dvec(O0, arrnumprod(MO, mscale), color: red, shrink: 0, rotate_label: false, thickness: 1pt)
      }



    },
  )
  })
]

= Champ équiprojectif

Cas du champ de vitesse d'un solide indéformable.

#align(center)[
  #cetz.canvas({
    let O0 = (-8, 0, 0)
    let x = (3, 0, 0)
    let y = (0, 3, 0)
    let A = (1, 2, 0)
    let B = (-2.5, 5, 0)
    let BA = arrsub(A, B)
    let AB = arrsub(B, A)
    let lAB = anorm(AB)
    let u = normalize(BA)
    let v = arotz90(u)
    let R = (0, 0, -.35)
    let VA = arradd(arrnumprod(u, 1.5), arrnumprod(v, -2.5))
    let VB = arradd(VA, arrcrossprod(BA, R))
    let ua = normalize(VA)
    let va = arotz90(ua, inv: true)
    let ub = normalize(VB)
    let vb = arotz90(ub, inv: true)
    let Ha = arradd(A, arrnumprod(u, arrdotprod(VA, u)))
    let Hb = arradd(B, arrnumprod(u, arrdotprod(VB, u)))
    let construction_line_thickness = 0.5pt

    catmull((2, 3), (0, 6), (-4, 4), (-1, 2), tension: .4, stroke: black, close: true, name: "potato", fill: yellow.lighten(50%))
    content((name: "potato", anchor: 10%), anchor: "west", padding: .3)[$(S_1)$]
    dpoint(A, label: "A", anchor: "west")
    dpoint(B, label: "B", anchor: "south")
    dvec(A, arradd(A, VA), color: blue, label: [$#mvec[V] (A in 1 slash 0)$], rotate_label: false, thickness: 2pt, anchor: "north-west", label_fill: none, anchor_at: 100%)
    dvec(B, arradd(B, VB), color: blue, label: [$#mvec[V] (B in 1 slash 0)$], rotate_label: false, thickness: 2pt, anchor: "north", label_fill: none, anchor_at: 100%)
    dpoint(O0, label: [$O_0$], anchor: "north")
    dvec(O0, arradd(O0, x), label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
    dvec(O0, arradd(O0, y), label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
    line(A, arradd(A, arrnumprod(va, 10)), stroke: (paint: black, thickness: construction_line_thickness), name: "perpA")
    line(B, arradd(B, arrnumprod(vb, 10)), stroke: (paint: black, thickness: construction_line_thickness), name: "perpB")
    line(arradd(A, arrnumprod(u, .5 * lAB)), arradd(B, arrnumprod(u, -.5 * lAB)), stroke: (paint: black, thickness: construction_line_thickness))

    intersections("i", "perpA", "perpB")
    dpoint("i.0", label: $I$, anchor: "north")
    dangle3p(A, arradd(A, ua), arradd(A, va), right: true, radius: .25)
    dangle3p(B, arradd(B, ub), arradd(B, vb), right: true, radius: .25)
    line(arradd(A, VA), Ha, stroke: (paint: black, thickness: construction_line_thickness))
    line(arradd(B, VB), Hb, stroke: (paint: black, thickness: construction_line_thickness))
    dangle3p(Ha, A, arradd(A, VA), right: true, radius: .25, color: red)
    dangle3p(Hb, B, arradd(B, VB), right: true, radius: .25, color: red)
    dimension_line(Ha, A, label: [$V_"AB"$], inv: true, offs: 3, ratio: 90%)
    dimension_line(Hb, B, label: [$V_"AB"$], inv: true, offs: 3, ratio: 90%)

    hide(line("i.0", A, stroke: (paint: black, thickness: 2pt), name: "IA"))
    line("i.0", arradd(A, VA), stroke: (paint: blue, thickness: .5pt), name: "IA2")
    hide(line("i.0", B, stroke: (paint: black, thickness: 2pt), name: "IB"))
    line("i.0", arradd(B, VB), stroke: (paint: blue, thickness: .5pt), name: "IB2")
    let nv = 5
    let pv = 100% / nv
    for i in range(1, nv) {

      dvec((name: "IA", anchor: i * pv), (name: "IA2", anchor: i * pv), color: blue, label: none, thickness: .5pt, anchor: "north-west", label_fill: none, anchor_at: 100%)
      dvec((name: "IB", anchor: i * pv), (name: "IB2", anchor: i * pv), color: blue, label: none, thickness: .5pt, anchor: "north-west", label_fill: none, anchor_at: 100%)
    }

    // dvec(O0, z, label: [$#mvec[z]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
    // dvec(O0, M, label: [$#mvec[$O_0M$]$], color: blue, shrink: 4pt, rotate_label: false)
    // dpoint(O0, label: [$O_0$], anchor: "north")
    // dpoint(M, label: [$M$], anchor: "north-west", color:red)
  })
]

= Liaisons 3D

#let polygon(verts, ..args) = {
  let n = verts.len()
  for i in range(n) {
    let A = verts.at(i)
    let B = verts.at(calc.rem(i + 1, n))
    line(A, B, ..args)
  }
}

#align(center)[
  #cetz.canvas({
    ortho(
    // x: 30deg,
    // y: 30deg,
    // z: 0deg,
    {
      let R = (0, 0, 7)
      let MO = (0, 0, 20)
      let O0 = (0, 0, 0)
      let nr = 10
      let ntheta = 4
      let rmax = 5
      let rmin = 1
      let mscale = .1
      let x = (3, 0, 0)
      let y = (0, 3, 0)
      let z = (0, 0, 3)
      let ntheta = 20
      let radius = 2
      // circle(O0, radius:radius)

      for theta in range(ntheta){
        let theta0 = 2 * calc.pi * theta / ntheta
        let theta1 = 2 * calc.pi * (theta + 1) / ntheta
        let verts = (
          (radius*calc.cos(theta0), radius*calc.sin(theta0), 0),
          (radius*calc.cos(theta1), radius*calc.sin(theta1), 0),
          (radius*calc.cos(theta1), radius*calc.sin(theta1), 2),
          (radius*calc.cos(theta0), radius*calc.sin(theta0), 2),
        )
        polygon(verts, stroke: (paint: black, thickness: 1pt), fill:white)
      }
      circle((0,0, 2), radius:radius, stroke: (paint: black, thickness: 1pt), fill:white)



    dvec(O0, x, label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt, anchor:"north", label_fill:none)
      dvec(O0, y, label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O0, z, label: [$#mvec[z]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
    },
  )
  })
]

= section

#align(center)[
  #cetz.canvas({
    let e = 1.
    let a = 2 * e
    let G = (0, 0, 0)
    let P = (0, -(a + e/2), 0)
    let O = (0, 0, 0)
    let x = (3, 0, 0)
    let y = (0, 3, 0)
    let vrad = 0.3
    dvec(O, arradd(O, x), label: [$#mvec[z]_1$], color: green, shrink: 0, rotate_label: false, thickness: 1pt, label_fill: none, anchor: "south", padding: 6pt, anchor_at: 100%)
    dvec(O, arradd(O, y), label: [$#mvec[y]_1$], color: green, shrink: 0, rotate_label: false, thickness: 1pt, label_fill: none, anchor: "east", padding: 6pt, anchor_at: 100%)
    // circle(O, radius: vrad, stroke: green, fill: white)
    // for theta in (45deg, 135deg, 225deg, 315deg) {
    //   let P = (vrad * calc.cos(theta), vrad * calc.sin(theta), 0)
    //   line(O, P, stroke: (paint: green, thickness: 1pt))
    // }
    // content(O, anchor: "east", padding:12pt)[#text(fill: green)[$#mvec[x]_0$]]
    // SECTION EN CROIX
    line((-e / 2, -(a + e / 2)), 
    (e / 2, -(a + e / 2)), 
    (e / 2, -e / 2), 
    (e / 2 + a, -e / 2), 
    (e / 2 + a, e/2),
    (e / 2, e/2),
    (e / 2, a + e / 2),
    (-e / 2, a + e / 2),
    (-e / 2, e / 2),
    (-e / 2 - a, e / 2),
    (-e / 2 - a, -e / 2),
    (-e / 2, -e / 2),
    close: true,
    stroke: (paint: black, thickness: 1pt))
    dimension_line((-e/2, -a - e), (e/2, -a -e), label: [$e$], inv: true, offs: 1.5)
    dimension_line((e/2, -a - e), (e/2 + a, -a - e), label: [$a$], inv: true, offs: 1.5)
    dimension_line((-e/2-a, -a - e), (-e/2, -a - e), label: [$a$], inv: true, offs: 1.5)
    dimension_line((-e -a, -a - e/2), (-e -a, - e/2), label: [$a$], inv: false, offs: 1.5)
    dimension_line((-e -a, -e/2), (-e -a, e/2), label: [$e$], inv: false, offs: 1.5)
    dimension_line((-e -a, e/2), (-e -a, a + e/2), label: [$a$], inv: false, offs: 1.5)
    dpoint(G, label: "G", anchor: "east")
    dpoint(P, label: "P", anchor: "north")
    // let x = (3, 0, 0)
    // let y = (0, 3, 0)
    // let A = (1, 2, 0)
    // let B = (-2.5, 5, 0)
    // let BA = arrsub(A, B)
    // let AB = arrsub(B, A)
    // let lAB = anorm(AB)
    // let u = normalize(BA)
    // let v = arotz90(u)
    // let R = (0, 0, -.35)
    // let VA = arradd(arrnumprod(u, 1.5), arrnumprod(v, -2.5))
    // let VB = arradd(VA, arrcrossprod(BA, R))
    // let ua = normalize(VA)
    // let va = arotz90(ua, inv: true)
    // let ub = normalize(VB)
    // let vb = arotz90(ub, inv: true)
    // let Ha = arradd(A, arrnumprod(u, arrdotprod(VA, u)))
    // let Hb = arradd(B, arrnumprod(u, arrdotprod(VB, u)))
    // let construction_line_thickness = 0.5pt

    // catmull((2, 3), (0, 6), (-4, 4), (-1, 2), tension: .4, stroke: black, close: true, name: "potato", fill: yellow.lighten(50%))
    // content((name: "potato", anchor: 10%), anchor: "west", padding: .3)[$(S_1)$]
    // dpoint(A, label: "A", anchor: "west")
    // dpoint(B, label: "B", anchor: "south")
    // dvec(A, arradd(A, VA), color: blue, label: [$#mvec[V] (A in 1 slash 0)$], rotate_label: false, thickness: 2pt, anchor: "north-west", label_fill: none, anchor_at: 100%)
    // dvec(B, arradd(B, VB), color: blue, label: [$#mvec[V] (B in 1 slash 0)$], rotate_label: false, thickness: 2pt, anchor: "north", label_fill: none, anchor_at: 100%)
    // dpoint(O0, label: [$O_0$], anchor: "north")
    // dvec(O0, arradd(O0, x), label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
    // dvec(O0, arradd(O0, y), label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
    // line(A, arradd(A, arrnumprod(va, 10)), stroke: (paint: black, thickness: construction_line_thickness), name: "perpA")
    // line(B, arradd(B, arrnumprod(vb, 10)), stroke: (paint: black, thickness: construction_line_thickness), name: "perpB")
    // line(arradd(A, arrnumprod(u, .5 * lAB)), arradd(B, arrnumprod(u, -.5 * lAB)), stroke: (paint: black, thickness: construction_line_thickness))

    // intersections("i", "perpA", "perpB")
    // dpoint("i.0", label: $I$, anchor: "north")
    // dangle3p(A, arradd(A, ua), arradd(A, va), right: true, radius: .25)
    // dangle3p(B, arradd(B, ub), arradd(B, vb), right: true, radius: .25)
    // line(arradd(A, VA), Ha, stroke: (paint: black, thickness: construction_line_thickness))
    // line(arradd(B, VB), Hb, stroke: (paint: black, thickness: construction_line_thickness))
    // dangle3p(Ha, A, arradd(A, VA), right: true, radius: .25, color: red)
    // dangle3p(Hb, B, arradd(B, VB), right: true, radius: .25, color: red)
    // dimension_line(Ha, A, label: [$V_"AB"$], inv: true, offs: 3, ratio: 90%)
    // dimension_line(Hb, B, label: [$V_"AB"$], inv: true, offs: 3, ratio: 90%)

    // hide(line("i.0", A, stroke: (paint: black, thickness: 2pt), name : "IA"))
    // line("i.0", arradd(A, VA), stroke: (paint: blue, thickness: .5pt), name : "IA2")
    // hide(line("i.0", B, stroke: (paint: black, thickness: 2pt), name : "IB"))
    // line("i.0", arradd(B, VB), stroke: (paint: blue, thickness: .5pt), name : "IB2")
    // let nv = 5
    // let pv = 100% / nv
    // for i in range(1, nv) {

    //   dvec((name:"IA", anchor:i * pv), (name:"IA2", anchor:i * pv), color: blue, label: none, thickness: .5pt, anchor: "north-west", label_fill: none, anchor_at: 100%)
    //   dvec((name:"IB", anchor:i * pv), (name:"IB2", anchor:i * pv), color: blue, label: none, thickness: .5pt, anchor: "north-west", label_fill: none, anchor_at: 100%)
    // }


  })
]

= Poutre

#align(center)[

  #cetz.canvas({
    let L = 5
    let nhatch = 8
    let O0 = (0, 0)
    let x = (2, 0, 0)
    let y = (0, 2, 0)
    let bold = 2pt
    let light = .5pt
    let fat = 3pt
    let r = -30deg
    let g = 4.
    let Nf = 10
    let p = 2.5

    // grid((0,0), (L, 8), stroke: (paint:black.lighten(50%), thickness:.2pt), step: .2)
    // grid((0, 0), (L, 8), stroke: (paint: black.lighten(50%), thickness: .2pt))
    // GRID


    line(O0, (3 * L, 0), stroke: (paint: blue, thickness: bold))
    line((-1, -1), (-1, 1), stroke: (paint: black, thickness: bold))
    for i in range(nhatch + 1) {
      let P = (-1, i * 2 / nhatch - 1)
      let Q = (-1.5, i * 2 / nhatch - 1.5)
      line(P, Q, stroke: (paint: black, thickness: light))
    }
    circle((0, 0), radius: .3, stroke: (paint: black, thickness: bold), fill: white)
    line((-1, 0), (0, 0), stroke: (paint: black, thickness: bold))

    dpoint((2 * L, 0), label: [$B$], anchor: "north-west")
    dpoint((L, 0), label: [$A$], anchor: "north-west")
    dpoint((3 * L, 0), label: [$C$], anchor: "north-west")
    for i in range(0, Nf + 1) {

      let x = 2 * L + L * i / Nf
      let y = p
      let B = (x, 0, 0)
      let C = (x, y, 0)
      // dpoint(B, label: [$B B_#str(i)$], anchor: "north")
      dvec(C, B, label: none, color: red, shrink: 0, rotate_label: false, thickness: 1pt)

    }
    line((2 * L, p), (3 * L, p), stroke: (paint: red, thickness: light))
    line((2 * L, 0), (2 * L, -1), stroke: (paint: black, thickness: bold))
    line((2 * L - 1, -1), (2 * L + 1, -1), stroke: (paint: black, thickness: bold))
    for i in range(nhatch + 1) {
      let P = (2 * L - 1 + i * 2 / nhatch, -1)
      let Q = (2 * L - 1 + i * 2 / nhatch - .5, -1.5)
      line(P, Q, stroke: (paint: black, thickness: light))
    }
    circle((2 * L, -.2), radius: .15, stroke: (paint: black, thickness: bold), fill: white)
    dvec((3 * L + .5, 0), arradd((3 * L + .5, 0), x), label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat)
    dvec(O0, arradd(O0, y), label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat, padding: 4pt)
    dpoint(O0, label: [$O_0$], anchor: "north-west")
    dimension_line((0, 0), (L, 0), label: [$L / 2$], inv: true, offs: 2)
    dimension_line((L, 0), (2 * L, 0), label: [$L / 2$], inv: true, offs: 2)
    dimension_line((2 * L, 0), (3 * L, 0), label: [$L / 2$], inv: true, offs: 2)
    dvec((L + 2, 2), (L, 0), label: [$#mvec[F]$], color: red, shrink: 0, rotate_label: false, thickness: bold, padding: 4pt)
    dangle3p((L, 0), (L + 2, 0), (L + 2, 2), right: false, radius: 2, color: green, label: [$45^o$])
  })
]