// TEMPLATE IMPORT
#import "../../../templates/conf.typ": conf, todo, comment, idea, note, important
#import "../../../templates/drawing.typ": dvec, dpoint, dangle3p, dimension_line, arotz90, arrnumprod, arrsub, anorm, normalize, rotmat2D, dispvcol, arradd, mvec
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





// #let theorem(body, title: none, footer: none) = showybox(
//   title: title,
//   frame: (
//     border-color: blue,
//     title-color: blue.lighten(30%),
//     body-color: none,
//     footer-color: blue.lighten(80%),
//   ),
//   footer: footer,
// )[#body]


// MAIN DOCUMENT
= Introduction

Les vecteurs sont la base d'un pan entier des mathématiques: l'algèbre linéaire. Dans ce cours, nous ne cherchons pas à apporter une vision exhaustive des vecteurs mais nous nous focaliserons sur des points pratiques afin de pouvoir décrire les champs physiques qui vous seront utiles en mécanique.

On considère ainsi qu'un vecteur $#mvec[V]$ est un object mathématique défini par 3 propriétés:
/ Sa direction: une droite $(D)$, par exemple.
/ Son sens: le sens de parcours de la droite parmi les deux possibles.
/ Sa norme: elle quantifie l'intensité du vecteur, est notée $abs(#mvec[V])$ et a une unité qui dépend de ce que représente le vecteur. Par exemple, un champ de vitesse aura une norme en #qty("", "m/s") et une force en #qty("", "N"). Un vecteur de norme 1 sans unité est un vecteur unitaire.

Dans tout le cours, on manipulera des points ($A$, $B$, ... ) et des vecteurs ($#mvec[u]$, $#mvec[AB]$, ...)#footnote[Voir #link("https://fr.wikipedia.org/wiki/Espace_affine")[espaces affines].]. On utilisera largement la propriété que si $B = A + #mvec[u]$, alors $#mvec[AB] = #mvec[u]$. Le vecteur $#mvec[AB]$ est le vecteur qui va de $A$ à $B$ et son unité est le #qty("", "m").

= Opération sur les vecteurs

== Addition et relation de Chasles

== Addition de vecteurs

#align(center)[
  #cetz.canvas({

    let pcolor = black
    let A = (0, 0)
    let B = (5, 0)
    let C = (2, 4)
    let D = (7, 4)
    line(B, D, stroke: (paint: black, thickness: 1pt, dash: "dashed"))
    line(C, D, stroke: (paint: black, thickness: 1pt, dash: "dashed"))
    dvec(A, B, label: mvec[u], color: red)
    dvec(A, C, label: mvec[v], color: blue)
    dvec(A, D, label: [$#mvec[u] + #mvec[v]$], color: green)
  })]

La somme de deux vecteurs est un vecteur qui représente la diagonale du parallélogramme formé par les deux vecteurs.

=== Relation de Chasles
#align(center)[
  #cetz.canvas({

    let pcolor = black
    let A = (0, 0)
    let C = (10, 0)
    let B = (7, 3)
    dvec(A, B, label: mvec[AB], color: red, shrink: 4pt)
    dvec(B, C, label: mvec[BC], color: blue, shrink: 4pt)
    dvec(A, C, label: [$#mvec[AC]=#mvec[AB]+#mvec[BC]$], color: green, shrink: 4pt)
    dpoint(A, label: "A", anchor: "north")
    dpoint(B, label: "B", anchor: "north")
    dpoint(C, label: "C", anchor: "north")
  })]

Si $A$, $B$ et $C$ sont 3 points, alors ils vérifient la relation de Chasles: $#mvec[AC] = #mvec[AB] + #mvec[AC]$.



=== Produit vecteur nombre

#align(center)[
  #cetz.canvas({
    dvec((-2.5, 0), (2.5, 0), label: mvec[u], color: red)
    dvec((-5, -1), (5, -1), label: mvec[2 u], color: green)
    dvec((1.125, -2), (-1.125, -2), label: mvec[-1/2 u], color: blue, rev: true)
  })]


Le produit d'un vecteur $#mvec[V]$ par un nombre $k$ est un vecteur noté $k#mvec[V]$ et est défini par:
/ Sa direction: la même que $#mvec[V]$.
/ Son sens: le même que $#mvec[V]$ si $k > 0$ et opposé si $k < 0$.
/ Sa norme: $abs(k)#mvec[V]$.

On peut ainsi multiplier un vecteur par un nombre pour changer son intensité d'un facteur $k$. Si $k$ est négatif, le sens du vecteur est inversé.

== Produit scalaire

#align(center)[
  #cetz.canvas({

    let pcolor = black
    let A = (0, 0)
    let C = (10, 0)
    let B = (7, 3)
    let D = (7, 0)
    line(B, D, stroke: (paint: black, thickness: 1pt))
    dvec(A, B, label: mvec[u], color: red, shrink: 0)
    dvec(A, C, label: mvec[v], color: blue, shrink: 0)
    dangle3p(D, B, C, right: true, radius: .25)
    dangle3p(A, B, C, radius: 3, label: $theta$, color: green)
    dimension_line(A, D, label: [$ norm( #mvec[u]) cos(theta) $], inv: true, offs: 2, ratio: 90%)

  })]


Le produit scalaire de deux vecteurs $#mvec[u]$ et $#mvec[v]$ est un nombre noté $#mvec[u] dot #mvec[v]$ et est défini par:

$ #mvec[u] dot #mvec[v] = norm(#mvec[u]) norm(#mvec[v]) cos(theta) $

Où $theta$ est l'angle entre $#mvec[A]$ et $#mvec[B]$.

Il a les propriétés suivantes:
- Il est commutatif: $#mvec[u] dot #mvec[v] = #mvec[v] dot #mvec[u]$.
- Il permet de calculer les angles entre deux vecteurs, ou de projeter un vecteur sur un autre.

== Produit vectoriel

#let arrcrossprod(a0, a1) = {
  let out = (
    a0.at(1) * a1.at(2) - a0.at(2) * a1.at(1),
    a0.at(2) * a1.at(0) - a0.at(0) * a1.at(2),
    a0.at(0) * a1.at(1) - a0.at(1) * a1.at(0),
  )
  out
}

#align(center)[
  #cetz.canvas({
    ortho(
    // x: 35.26deg,
    // y: 45deg,
    // z: 0deg,
    {
      let pcolor = black
      let A = (0, 0, 0)
      let B = (8, 0, 0)
      let C = (-1, 4, 0)
      let D = (0, 0, 5)
      // let D = arrcrossprod(B, C)
      dvec(A, B, label: mvec[u], color: red, shrink: 0, rotate_label: false)
      dvec(A, C, label: mvec[v], color: blue, shrink: 0, rotate_label: false)
      dvec(A, D, label: [$#mvec[u] and #mvec[v]$], color: green, shrink: 0, rotate_label: false)
      //
      dangle3p(A, B, C, label: $theta$, radius:2.5, right: false, label-radius: 2, color:yellow)
      dangle3p(A, B, D, right: true, radius:.75)
      dangle3p(A, C, D, right: true, radius:.75)
      dimension_line(A, B, label: [$ norm( #mvec[u])$], inv: true, offs: 2, ratio: 90%)
      dimension_line(A, C, label: [$ norm( #mvec[v])$], inv: false, offs: 2, ratio: 90%)
      dpoint(A, label: "A", anchor: "south-west")
      dpoint(B, label: "B", anchor: "south")
      dpoint(C, label: "C", anchor: "south")
      line(B, C, stroke: (paint: black, thickness: 1pt))
    },
  )
  })
]

Le produit vectoriel de deux vecteurs $#mvec[u]$ et $#mvec[v]$ est un vecteur noté $#mvec[u] and #mvec[v]$ et est défini par:
/ Sa direction: perpendiculaire au plan formé par $#mvec[u]$ et $#mvec[v]$.
/ Son sens: donné par la règle de la main droite.
/ Sa norme: $abs(#mvec[u] and #mvec[v]) = abs(#mvec[u]) dot abs(#mvec[v]) dot sin(theta)$

Il a les propriétés suivantes:

- Le produit vectoriel est anti-commutatif: $#mvec[u] and #mvec[v] = - #mvec[v] and #mvec[u]$.
- La norme du produit vectoriel est maximale lorsque $#mvec[u]$ et $#mvec[v]$ sont orthogonaux.
- Le produit vectoriel est nul si $#mvec[u]$ et $#mvec[v]$ sont colinéaires. 
- Sa norme correspond à 2 fois l'aire du triangle $"ABC"$.


== Le produit mixte

#align(center)[
  #cetz.canvas({
    ortho(
    // x: 35.26deg,
    // y: 45deg,
    // z: 0deg,
    {
      let A = (0, 0, 0)
      let B = (0, 0, 6)
      let C = (3, 1, 0)
      // let D = (0, 5, 0)
      let D = arrnumprod( arrcrossprod(B, C), .3)
      let E = (5,9,3)
      dpoint(A, label: "A", anchor: "north")
      dpoint(B, label: "B", anchor: "north")
      dpoint(C, label: "C", anchor: "north")
      dpoint(E, label: "D", anchor: "south-west")
      line(B, C, stroke: (paint: black, thickness: 1pt))
      line(C, E, stroke: (paint: black, thickness: 1pt))
      line(B, E, stroke: (paint: black, thickness: 1pt))
      dvec(A, B, label: mvec[u], color: red, shrink: 0, rotate_label: false)
      dvec(A, C, label: mvec[v], color: blue, shrink: 0, rotate_label: false)
      dvec(A, D, label: [$#mvec[u] and #mvec[v]$], color: green, shrink: 0, rotate_label: false)
      dvec(A, E, label: mvec[w], color: rgb("#343091"), shrink: 0, rotate_label: false)
      //
      dangle3p(A, D, E, label: $phi$, radius:4, right: false, label-radius: 4.3, color:yellow)
      dangle3p(A, B, D, right: true, radius:.75)
      dangle3p(A, C, D, right: true, radius:.75)
      
    },
  )
  })
]

Le poduit mixte des vecteurs $#mvec[u]$, $#mvec[v]$ et $#mvec[w]$ est noté$( #mvec[u], #mvec[v], #mvec[w] )$ et est défini par:

$ ( #mvec[u], #mvec[v], #mvec[w] ) = (#mvec[u] and #mvec[v]) dot  #mvec[w] $




