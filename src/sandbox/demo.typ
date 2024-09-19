// TEMPLATE IMPORT
#import "../templates/conf.typ": conf, todo, comment, idea, note, important
#import "../templates/drawing.typ": dvec, dpoint, dangle3p, dimension_line, arotz90, arrnumprod, arrsub, anorm, normalize, rotmat2D, dispvcol, arradd, mvec
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


#let torseur6(rx:0, ry:0, rz:0, mx:0, my:0, mz:0, p:[$O_0$], basis:0) = {
  let m = math.mat(delim:"{", (rx,mx), (ry,my), (rz,mz))
  $attach(#m, br: #p ","  cal(B)_#str(basis) )$
}

$ torseur6(rx: F_y , mz: L F_y  ) $


#let torseur2(R:mvec[0] , M:mvec[0], p:[$O_0$]) = {
  let m = math.mat(delim:"{", (R,), (M,))
  $attach(#m, br: #p )$
}

$ torseur2(R: #mvec[F]_y , p:A ) $

#let torseur1(T:"0") = {
  let m = math.mat(delim:"{", (T,))
  $attach(#m)$
}

$ torseur1(T: T_0 ) $