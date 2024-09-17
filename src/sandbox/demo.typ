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
#let course = "MECA510 - Statique"
#let block = "Rappels"
#let section = "MECA3-FISA"
#let teacher = "Ludovic Charleux"
#let email = "ludovic.charleux@univ-smb.fr"


#show: doc => conf(
  course: course,
  block: block,
  section: section,
  teacher: teacher,
  email:email,
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


#strong(smallcaps("Exercices")) hhhhh #smallcaps("Exercices")

= Classes

#let data = ("name": "tutu", "label": "hello")

#data.name

#(
  for i in (1, 2, 3) {
    str(i)
  }
)

#a0.map(str)

#let a2 = (1, 2, 3)

$mat(delim:"[", a2)$

#let data = ((1, 2), (3, 4), (5, 6))
#let m-data = data.map(x => ($W_(#x.at(0)#x.at(1))$,))
#let matrix = math.mat(delim: "[", ..m-data)

$ #matrix $

#rotmat2D(90deg)

rotation de 90° de #dispvcol(a0) est #dispvcol(arotz90(a0))

#arotz90(a0)