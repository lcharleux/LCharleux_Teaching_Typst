// TEMPLATE IMPORT
#import "../../../templates/conf.typ": conf, todo, comment, idea, note, important
#import "../../../templates/drawing.typ": dvec, dpoint, dangle3p, dimension_line, arotz90, arrnumprod, arrsub, anorm, normalize, rotmat2D, dispvcol, arradd, mvec, arrcrossprod, arrdotprod, torseur1, torseur2, torseur6, part_label
#import "@preview/unify:0.6.0": num, qty, numrange, qtyrange
#import "@preview/cetz:0.2.2"
#import "@preview/showybox:2.0.1": showybox
#import "@preview/chic-hdr:0.4.0": *
#import cetz.draw: *
#import "@preview/physica:0.9.3": *
#set math.equation(numbering: "(1)")

// DOCUMENT SETUP
#let course = "MECA510 - Statique"
#let block = "Statique"
#let section = "MECA3-FISA"
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


= Cours

= Exercices

== Dispositif de bridage



#align(center)[

  #cetz.canvas({
    let L = 10
    let nhatch = 20
    let O0 = (0, 0)
    let A = (0, 3)
    let B = (L, 3)
    let x = (2, 0, 0)
    let y = (0, 2, 0)
    let bold = 2pt
    let light = .5pt
    let fat = 3pt

    // grid((0,0), (L, 8), stroke: (paint:black.lighten(50%), thickness:.2pt), step: .2)
    // grid((0,0), (L, 8), stroke: (paint:black.lighten(50%), thickness:.2pt))
    // GRID
    line((0, 6), (L, 6), stroke: (paint: black, thickness: light))
    line((0, 4), (L, 4), stroke: (paint: black, thickness: light))
    line((0, 0), (0, 7), stroke: (paint: black, thickness: light))
    line((3, 0), (3, 7), stroke: (paint: black, thickness: light))
    line((7, 0), (7, 7), stroke: (paint: black, thickness: light))
    line((10, 0), (10, 7), stroke: (paint: black, thickness: light))

    line(O0, (L, 0), stroke: (paint: black, thickness: bold))
    for i in range(nhatch + 1) {
      let P = (i * L / nhatch, 0)
      let Q = (i * L / nhatch - 0.5, -0.5)
      line(P, Q, stroke: (paint: black, thickness: light))
    }

    line(O0, A, stroke: (paint: black, thickness: 2pt))
    line((L, 0), B, stroke: (paint: black, thickness: 2pt))

    line((L / 2, 0), (L / 2, .9), stroke: (paint: black, thickness: bold))
    line((L / 4, .9), (3 * L / 4, .9), stroke: (paint: black, thickness: bold))
    line((L / 4, 1.1), (3 * L / 4, 1.1), stroke: (paint: red, thickness: bold))
    line((L / 2, 1.1), (L / 2, 4), stroke: (paint: red, thickness: bold))
    line((L / 4, 4), (3 * L / 4, 4), stroke: (paint: red, thickness: bold))

    line(A, (2, 5), stroke: (paint: green, thickness: bold))
    line((2, 5), (3, 5), stroke: (paint: green, thickness: bold))
    line((3, 5), (3, 4), stroke: (paint: green, thickness: bold), mark: (end: ">"))

    line(B, (L - 2, 5), stroke: (paint: maroon, thickness: bold))
    line((L - 2, 5), (L - 3, 5), stroke: (paint: maroon, thickness: bold))
    line((L - 3, 5), (L - 3, 4), stroke: (paint: maroon, thickness: bold), mark: (end: ">"))

    line((2, 5), (2, 6), stroke: (paint: green, thickness: bold))

    line((2, 6), (6.2, 6), stroke: (paint: blue, thickness: bold))
    line((L - 3, 6), (L - 3, 7), stroke: (paint: orange, thickness: bold))
    line((7, 7), (5, 7), stroke: (paint: orange, thickness: bold))
    line((5, 7), (5, 6), stroke: (paint: orange, thickness: bold))
    rect((4, 5.5), (6, 6.5), stroke: (paint: orange, thickness: bold), fill: white)
    line((4, 5.5), (6, 6.5), stroke: (paint: orange, thickness: bold))


    circle(A, radius: .3, stroke: (paint: black, thickness: 2pt), fill: white)
    circle(B, radius: .3, stroke: (paint: black, thickness: 2pt), fill: white)
    circle((2, 6), radius: .3, stroke: (paint: green, thickness: 2pt), fill: white)
    circle((L - 3, 6), radius: .5, stroke: (paint: orange, thickness: 2pt), fill: white)
    line((L - 3, 5), (L - 3, 6), stroke: (paint: maroon, thickness: bold))
    circle((L - 3, 6), radius: .3, stroke: (paint: maroon, thickness: 2pt), fill: white)


    dvec(O0, arradd(O0, x), label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat)
    dvec(O0, arradd(O0, y), label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat, padding: 4pt)
    dpoint(O0, label: [$O_0$], anchor: "south-east")
    part_label((8, 0), $0$, color: black, anchor: "south")
    part_label((6, 1.1), $1$, color: red, anchor: "south")
    part_label((2, 5), $2$, color: green, anchor: "south-west")
    part_label((L - 3, 5), $3$, color: maroon, anchor: "south-west")
    part_label((3, 6), $4$, color: blue, anchor: "south")
    part_label((6, 7), $5$, color: orange, anchor: "south")

    dpoint(A, label: [$A$], anchor: "south-east")
    dpoint(B, label: [$B$], anchor: "south-west")
    dpoint((2, 6), label: [$C$], anchor: "south-east")
    dpoint((L - 3, 6), label: [$D$], anchor: "south-west")
    dpoint((3, 4), label: [$I$], anchor: "north-east")
    dpoint((L - 3, 4), label: [$J$], anchor: "north-west")
    dimension_line(O0, (3, 0), label: [$l$], inv: true)
    dimension_line((0, 0), (0, 4), label: [$h$], inv: false)
    dimension_line((7, 0), (10, 0), label: [$l$], inv: true)
    dimension_line((0, 0), (0, 6), label: [$H$], inv: false, offs: 3)
    dimension_line((0, 0), (10, 0), label: [$L$], inv: true, offs: 3)
  })
]


On considère un dispositif de bridage constitué de 5 pièces.
Il a pour fonction de serrer la pièce $(1)$ contre la pièce $(0)$ au moyen des brides $(2)$ et $(3)$.
On veut savoir quelle est la relation entre cet effort de serrage et l'action de la vis $(4)$ dans l'écrou $(5)$.

#note[Cet exercice est inspiré de #cite(<bremont1996mecanique2>, form:"full") page 97.]

On fait les hypothèses suivantes:
- Les longueurs $L$, $h$ et $H$ sont connues et constantes.
- L'écrou $(5)$ applique un effort de serrage $#mvec[R]_(53) = -S #mvec[x]_0$ sur la bride $(3)$.
- La pesanteur est négligée.
- Le référentiel $(0)$ est galiéen.
- Le problème est plan.

=== Questions

1. Faire le graphe des liaisons.
2. Faire un bilan d'actions mécaniques.
3. Définir les solides à isoler et l'ordre dans lequel vous comptez le faire afin de calculer l'effort appliqué par les brides sur la pièce $(1)$.
4. Calculer l'effort appliqué par les brides sur la pièce $(1)$ en fonction de $S$.
5. Conclure quant au choix des dimensions du systéme.


== Echelle contre un mur

#align(center)[

  #cetz.canvas({
    let L = 8
    let nhatch = 20
    let O0 = (0, 0)
    let A = (0, 3)
    let B = (L, 3)
    let x = (2, 0, 0)
    let y = (0, 2, 0)
    let bold = 2pt
    let light = .5pt
    let fat = 3pt

    // grid((0,0), (L, 8), stroke: (paint:black.lighten(50%), thickness:.2pt), step: .2)
    // grid((0, 0), (L, 8), stroke: (paint: black.lighten(50%), thickness: .2pt))
    // GRID


    line(O0, (L, 0), stroke: (paint: black, thickness: bold))
    line(O0, (0, L), stroke: (paint: black, thickness: bold))
    for i in range(nhatch + 1) {
      let P = (i * L / nhatch, 0)
      let Q = (i * L / nhatch - 0.5, -0.5)
      line(P, Q, stroke: (paint: black, thickness: light))
    }
    for i in range(nhatch + 1) {
      let P = (0, i * L / nhatch)
      let Q = (-0.5, i * L / nhatch - 0.5)
      line(P, Q, stroke: (paint: black, thickness: light))
    }
    dvec(O0, arradd(O0, x), label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat)
    dvec(O0, arradd(O0, y), label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat, padding: 4pt)
    dpoint(O0, label: [$O_0$], anchor: "south-east")
    line((4, .25), (.25, 6), stroke: (paint: blue, thickness: 2pt), name: "AB")
    circle((4, .25), radius: .25, stroke: (paint: blue, thickness: 2pt), fill: white)
    circle((.25, 6), radius: .25, stroke: (paint: blue, thickness: 2pt), fill: white)
    dpoint((name: "AB", anchor: 50%), label: [$G$], anchor: "south-west")

    part_label((7, 0), $0$, color: black, anchor: "south")
    part_label((1, 4.8), $1$, color: blue, anchor: "center")
    dpoint((4, 0), label: [$A$], anchor: "south-west")
    dpoint((0, 6), label: [$B$], anchor: "south-west")
    dvec((6, 7), (6, 3), label: [$#mvec[g] = -g #mvec[y]_0$], color: red, shrink: 0, rotate_label: false, thickness: bold, padding: 4pt)
    dimension_line(O0, (4, 0), label: [$x_A$], inv: true)
    dimension_line(O0, (0, 6), label: [$y_B$], inv: false)
    dimension_line((4, 0), (0, 6), label: [$L$], inv: true, invert_label: true)
  })
]

On considère l'échelle $(1)$ en équilibre contre le solide $(0)$.
Le contact en $A$ est avec frottement de coefficient $f$.
Le contact en $B$ est sans frottement.
Le centre de gravité de l'échelle est en $G$.

=== Questions

1. Faire un bilan d'actions mécaniques.
2. Ecrire l'équilibre du solide $(1)$.
3. En déduire à quelle conditions son équilibre est possible.


== VTT dans une pente

#align(center)[

  #cetz.canvas({
    let L = 8
    let nhatch = 20
    let O0 = (0, 0)
    let x = (2, 0, 0)
    let y = (0, 2, 0)
    let bold = 2pt
    let light = .5pt
    let fat = 3pt
    let r = -30deg
    let g = 4.
    rotate(z: r)
    {
      // grid((0,0), (L, 8), stroke: (paint:black.lighten(50%), thickness:.2pt), step: .2)
      // grid((0, 0), (L, 8), stroke: (paint: black.lighten(50%), thickness: .2pt))
      // GRID


      line(O0, (L, 0), stroke: (paint: black, thickness: bold))

      for i in range(nhatch + 1) {
        let P = (i * L / nhatch, 0)
        let Q = (i * L / nhatch - 0.5, -0.5)
        line(P, Q, stroke: (paint: black, thickness: light))
      }

      dvec(O0, arradd(O0, x), label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat)
      dvec(O0, arradd(O0, y), label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat, padding: 4pt)
      dpoint(O0, label: [$O_0$], anchor: "north-east")
      circle((2, 1), radius: 1, stroke: (paint: blue, thickness: 2pt), fill: none)
      circle((6, 1), radius: 1, stroke: (paint: blue, thickness: 2pt), fill: none)
      line((2, 1), (6, 1), stroke: (paint: blue, thickness: 2pt), name: "AB")
      line((4.5, 1), (4.5, 3), stroke: (paint: blue, thickness: 2pt), name: "CD")
      circle((2, 1), radius: .1, stroke: (paint: blue, thickness: 2pt), fill: white)
      circle((6, 1), radius: .1, stroke: (paint: blue, thickness: 2pt), fill: white)
      dpoint((2, 0), label: [$A$], anchor: "north-east")
      dpoint((6, 0), label: [$B$], anchor: "north-east")
      dpoint((4.5, 3), label: [$G_1$], anchor: "south")
      dvec((5, 7), (5 - g * calc.sin(r), 7 - g * calc.cos(r)), label: [$#mvec[g] = -g #mvec[y]_0$], color: red, shrink: 0, rotate_label: false, thickness: bold, padding: 4pt)


      line((5, 7), (5, 3), stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      dangle3p((5, 7), (5, 3), (5 - g * calc.sin(r), 7 - g * calc.cos(r)), radius: 3.5, label: $theta$, color: green)
      dimension_line((2, 0), (3.5, 0), label: [$l$], inv: true, offs: 1)
      dimension_line((2, 0), (6, 0), label: [$L$], inv: true, offs: 2)
      dimension_line((0, 0), (0, 3), label: [$H$], inv: false, offs: 2)
      line((0, 3), (4.5, 3), stroke: (paint: black, thickness: light))
      part_label((4, 2), $1$, color: blue, anchor: "center")
      part_label((1, -1), $0$, color: black, anchor: "center")
    }
  })
]

On considère un VTT en train de gravir une pente inclinée d'un angle $theta$ par rapport à l'horizontale.
Le problème est plan.
Il est considéré comme quasi statique.
Le VTT est donc en équilibre et ne bouge pas.
Le VTT dans son ensemble, roues comprises, peut être modélisé par un solide $(1)$.
Le VTT est modélisé par un solide $(1)$ de centre de gravité $G_1$.
Le contact au point $A$ est sans frottement.
Le contact au point $B$ est avec frottement de coefficient $f$.
Les longueurs $L$ et $H$ sont connues et constantes.
Le cycliste peut ajuster sa position en jouant sur la longueur $l$.



=== Questions

1. Faire un bilan d'actions mécaniques.
2. Ecrire l'équilibre du solide $(1)$.
3. En déduire à quelle conditions sa roue avant ne décolle pas du sol.
4. En déduire à quelle conditions le VTT ne glisse pas au point $B$.
5. Existe-t-il des pentes pour lesquelles le VTT ne peut pas monter? Si oui, lesquelles ? Quelle doit être la position du cycliste pour que le VTT puisse monter quand cela est possible.


== Poutre encastrée

#align(center)[

  #cetz.canvas({
    let L = 10
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


    line(O0, (L, 0), stroke: (paint: black, thickness: bold))
    line((0, -1), (0, 1), stroke: (paint: black, thickness: bold))
    for i in range(nhatch + 1) {
      let P = (0, i * 2 / nhatch - 1)
      let Q = (-.5, i * 2 / nhatch - 1.5)
      line(P, Q, stroke: (paint: black, thickness: light))
    }



    dpoint((L, 0), label: [$A$], anchor: "north-west")
    for i in range(Nf + 1) {
      let x = L * i / Nf
      let y = p
      let B = (x, 0, 0)
      let C = (x, y, 0)
      // dpoint(B, label: [$B B_#str(i)$], anchor: "north")
      dvec(C, B, label: none, color: red, shrink: 0, rotate_label: false, thickness: 1pt)

    }
    dvec((L + .5, 0), arradd((L + .5, 0), x), label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat)
    dvec(O0, arradd(O0, y), label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat, padding: 4pt)
    dpoint(O0, label: [$O_0$], anchor: "north-west")
    dimension_line((0, 0), (L, 0), label: [$L$], inv: true, offs: 2)
  })
]

On considère une poutre encastrée en $O_0$ et soumise à une force répartie $#mvec[p] = -p #mvec[y]_0$ uniforme sur toute sa longueur $L$.

=== Questions
1. Déterminer le torseur de la force répartie en $O_0$.
2. Déterminer la force concentrée équivalente à la force répartie.
3. Faire un bilan d'actions mécaniques.
4. Ecrire l'équilibre de la poutre et en déduire les actions de liaisons.

== Poutre sur 2 appuis et force répartie

#align(center)[

  #cetz.canvas({
    let L = 10
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


    line(O0, (L, 0), stroke: (paint: blue, thickness: bold))
    line((-1, -1), (-1, 1), stroke: (paint: black, thickness: bold))
    for i in range(nhatch + 1) {
      let P = (-1, i * 2 / nhatch - 1)
      let Q = (-1.5, i * 2 / nhatch - 1.5)
      line(P, Q, stroke: (paint: black, thickness: light))
    }
    circle((0, 0), radius: .5, stroke: (paint: black, thickness: bold), fill: white)
    line((-1, 0), (0, 0), stroke: (paint: black, thickness: bold))

    dpoint((L, 0), label: [$A$], anchor: "north-west")
    for i in range(1, Nf + 1) {
      let x = L * i / Nf
      let y = p * x / L
      let B = (x, 0, 0)
      let C = (x, y, 0)
      // dpoint(B, label: [$B B_#str(i)$], anchor: "north")
      dvec(C, B, label: none, color: red, shrink: 0, rotate_label: false, thickness: 1pt)

    }
    line(O0, (L, p), stroke: (paint: red, thickness: light))
    line((L, 0), (L, -1), stroke: (paint: black, thickness: bold))
    line((L - 1, -1), (L + 1, -1), stroke: (paint: black, thickness: bold))
    for i in range(nhatch + 1) {
      let P = (L -1 + i * 2 / nhatch, -1)
      let Q = (L -1 + i * 2 / nhatch - .5, -1.5)
      line(P, Q, stroke: (paint: black, thickness: light))
    }
    circle((L, -.2), radius: .2, stroke: (paint: black, thickness: bold), fill: white)
    dvec((L + .5, 0), arradd((L + .5, 0), x), label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat)
    dvec(O0, arradd(O0, y), label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat, padding: 4pt)
    dpoint(O0, label: [$O_0$], anchor: "north-west")
    dimension_line((0, 0), (L, 0), label: [$L$], inv: true, offs: 2)
  })
]

On considère une poutre encastrée en $O_0$ et soumise à une force répartie $#mvec[p] = -p  x/L #mvec[y]_0$ uniforme sur toute sa longueur $L$.

=== Questions
1. Déterminer le torseur de la force répartie en $O_0$.
2. Déterminer la force concentrée équivalente à la force répartie.
3. Faire un bilan d'actions mécaniques.
4. Ecrire l'équilibre de la poutre et en déduire les actions de liaisons.

// ==  Pieds du module lunaire Apollo


// #align(center)[
//   #cetz.canvas({
//     ortho(
//     x: 30deg,
//     y: 30deg,
    
//     // z: 0deg,
//     {
//       let scale = .5
//       let O0 = (0, 0, 0)
//       let x = (3, 0, 0)
//       let y = (0, 3, 0)
//       let z = (0, 0, 3)
//       let F = arrnumprod((12, 0, 0), scale)
//       let A = arrnumprod((9, 14, 0), scale)
//       let D = arrnumprod((0, 9, 4), scale)
//       let E = arrnumprod((0, 9, -4), scale)
//       let C = arrnumprod((0, 19, 4), scale)
//       let B = arrnumprod((0, 19, -4), scale)
//       let bold = 2pt
//       let light = .5pt
//       let fat = 3pt

//       dpoint(O0, label: [$O_0$], anchor: "north")
//       dvec(O0, x, label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
//       dvec(O0, y, label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
//       dvec(O0, z, label: [$#mvec[z]_0$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      
//       dpoint(O0, label: [$O_0$], anchor: "north")
//       dpoint(F, label: [$F$], anchor: "north-west", color:black)
//       dpoint(A, label: [$A$], anchor: "north-west", color:black)
//       dpoint(D, label: [$D$], anchor: "north-west", color:black)
//       dpoint(E, label: [$E$], anchor: "north-west", color:black)
//       dpoint(C, label: [$C$], anchor: "north-west", color:black)
//       dpoint(B, label: [$B$], anchor: "north-west", color:black)
//       line(D, F, stroke: (paint: black, thickness: bold))
//       line(E, F, stroke: (paint: black, thickness: bold))
//       line(A, F, stroke: (paint: black, thickness: bold))
//       for p in (D, E, B, C) {
//         line(A, p, stroke: (paint: black, thickness: bold))
//       }
//       for (p0, p1) in ((D, E), (E, B), (B, C), (C, D)) {
//         line(p0, p1, stroke: (paint: black, thickness: light))
//       }
//     dimension_line(C, D, label: [$l$], inv: true)
//     },
//   )
//   })
  
// ]

== Point de bascule

#align(center)[

  #cetz.canvas({
    let L = 4
    let H = 6
    let xA = 2
    let nhatch = 20
    let O0 = (0, 0)
    let A = (0, 3)
    let B = (L, 3)
    let x = (2, 0, 0)
    let y = (0, 2, 0)
    let bold = 2pt
    let light = .5pt
    let fat = 3pt
    let A = (xA, 0)
    let B = (xA + L, 0)
    let C = (xA + L, H)
    let D = (xA, H)
    let G = (xA + L / 2, H / 2)

    // grid((0,0), (L, 8), stroke: (paint:black.lighten(50%), thickness:.2pt), step: .2)
    grid((0, 0), (xA + L + 1, 8), stroke: (paint: black.lighten(50%), thickness: .2pt))
    // GRID


    line(O0, ((xA + L + 1), 0), stroke: (paint: black, thickness: bold))
    
    for i in range(nhatch + 1) {
      let P = (i * (xA + L + 1) / nhatch, 0)
      let Q = (i * (xA + L + 1) / nhatch - 0.5, -0.5)
      line(P, Q, stroke: (paint: black, thickness: light))
    }
    
    dvec(O0, arradd(O0, x), label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat)
    dvec(O0, arradd(O0, y), label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: fat, padding: 4pt)
    dpoint(O0, label: [$O_0$], anchor: "south-east")
    
    rect(A, C, stroke: (paint: blue, thickness: bold))
    part_label((xA + L, 0), $1$, color: blue, anchor: "south-east")
    part_label((xA + L + 1, 0), $0$, color: black, anchor: "north")
    dpoint(A, label: [$A$], anchor: "south-east")
    dpoint(B, label: [$B$], anchor: "south-west")
    dpoint(C, label: [$C$], anchor: "south-west")
    dpoint(D, label: [$D$], anchor: "south-east")
    dpoint(G, label: [$G$], anchor: "north-west")
    dvec((8, 7), (8, 5), label: [$#mvec[g] = -g #mvec[y]_0$], color: red, shrink: 0, rotate_label: false, thickness: bold, padding: 4pt )
     
    dimension_line(A, B, label: [$L$], inv: true)
    dimension_line(D, A, label: [$H$], inv: true, offs: 4)
    dvec((D), (0, H), label: [$#mvec[F]$], color: red, shrink: 0, rotate_label: false, thickness: bold, padding: 2pt, anchor: "center")
  })
]

On considère un solide de forme parallélépipédique $(1)$ en équilibre contre le solide $(0)$.
Le contact entre les solides $(1)$ et  $(0)$ dans la zone $[A B]$ est avec frottement de coefficient $f$.
Le centre de gravité du solide $(1)$ l'échelle est en $G$.
Une force $#mvec[F] = -F #mvec[x]_0$ est appliquée en $A$ sur le solide $(1)$.

=== Questions

1. Faire un bilan d'actions mécaniques.
2. Ecrire l'équilibre du solide $(1)$.
3. Dans quelles conditions le solide $(1)$ peut-il se mettre à glisser sur le solide $(0)$ ?
4. Dans quelles conditions se produit le basculement du solide $(1)$ autour du point $A$ ?



#bibliography("../../../biblio.bib", style: "institute-of-electrical-and-electronics-engineers", title: "Références")