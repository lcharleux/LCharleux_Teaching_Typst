// TEMPLATE IMPORT
#import "../../../templates/conf.typ": conf, todo, comment, idea, note, important
#import "../../../templates/drawing.typ": dvec, dpoint, dangle3p
#import "@preview/unify:0.6.0": num, qty, numrange, qtyrange
#import "@preview/cetz:0.2.2"
#import "@preview/showybox:2.0.1": showybox
#import cetz.draw: *
// #set math.equation(numbering: "(1)")

// DOCUMENT SETUP
#let course = "MECA510 - Statique"
#let block = "Rappels"
#let section = "MECA3-FISA"
#let teacher = "Ludovic Charleux"


#show: doc => conf(
  course: course,
  block: block,
  section: section,
  teacher: teacher,
  doc,
)


#let mvec(what) = $accent(what, ->)$



#let theorem(body, title:none, footer:none) = showybox(
  title: title,
  frame: (
    border-color: blue,
    title-color: blue.lighten(30%),
    body-color: none,
    footer-color: blue.lighten(80%),
  ),
  footer: footer,
)[#body]
// MAIN DOCUMENT
= Introduction

Les vecteurs sont la base d'un pan entier des mathématiques: l'algèbre linéaire. Dans ce cours, nous ne cherchons pas à apporter une vision exhaustive des vecteurs mais nous nous focaliserons sur des points pratiques afin de pouvoir décrire les champs physiques qui vous seront utiles en mécanique.

On considère ainsi qu'un vecteur $#mvec[V]$ est un object mathématique défini par 3 propriétés:
/ Sa direction: une droite $(D)$, par exemple.
/ Son sens: le sens de parcours de la droite parmi les deux possibles.
/ Sa norme: elle quantifie l'intensité du vecteur, est notée $abs(#mvec[V])$ et a une unité qui dépend de ce que représente le vecteur. Par exemple, un champ de vitesse aura une norme en #qty("", "m/s") et une force en #qty("", "N"). Un vecteur de norme 1 sans unité est un vecteur unitaire.

Dans tout le cours, on manipulera des points et des vecteurs#footnote[Voir #link("https://fr.wikipedia.org/wiki/Espace_affine")[espaces affines].]. On utilisera largement la propriété suivante:

#important[Si on considère deux points $A$ et $B$ et un vecteur #mvec[u]. On peut écrire que si $B = A + #mvec[u]$, alors $#mvec[AB] = #mvec[u]$.]

= Opération sur les vecteurs



#theorem(title: align(center)[ Relation de Chasles], 
footer: [Si $A$, $B$ et $C$ sont 3 points, alors ils vérifient la relation de Chasles: $#mvec[AC] = #mvec[AV] + #mvec[AC]$.])[
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
]

#theorem(title: align(center)[Produit vecteur nombre], 
footer: [Le produit d'un vecteur $#mvec[V]$ par un nombre $k$ est un vecteur noté $k#mvec[V]$ et est défini par:
/ Sa direction: la même que $#mvec[V]$.
/ Son sens: le même que $#mvec[V]$ si $k > 0$ et opposé si $k < 0$.
/ Sa norme: $abs(k)#mvec[V]$.])[
  #align(center)[
    #cetz.canvas({
      dvec((-2.5, 0), (2.5, 0), label: mvec[u], color: red)
      dvec((-5, -1), (5, -1), label: mvec[2 u], color: green)
      dvec((1.125, -2), (-1.125, -2), label: mvec[-1/2 u], color: blue, rev: true)
    })]
]
== Produit d'un vecteur avec un nombre

Le produit d'un vecteur $#mvec[V]$ par un nombre $k$ est un vecteur noté $k#mvec[V]$ et est défini par:
/ Sa direction: la même que $#mvec[V]$.
/ Son sens: le même que $#mvec[V]$ si $k > 0$ et opposé si $k < 0$.
/ Sa norme: $abs(k)#mvec[V]$.

== Produit scalaire

Le produit scalaire de deux vecteurs $#mvec[u]$ et $#mvec[v]$ est un nombre noté $#mvec[u] dot #mvec[v]$ et est défini par:

$#mvec[u] dot #mvec[v] = abs(#mvec[u]) dot abs(#mvec[v]) \cdot cos(theta)$

Où $theta$ est l'angle entre $#mvec[A]$ et $#mvec[B]$.
Le produit scalaire est commutatif: $#mvec[u] dot #mvec[v] = #mvec[v] dot #mvec[u]$.
Il permet de calculer les angles entre deux vecteurs, ou de projeter un vecteur sur un autre.

== Produit vectoriel

#theorem(title: "Produit vectoriel", footer: [Le produit vectoriel de deux vecteurs $#mvec[u]$ et $#mvec[v]$ est un vecteur noté $#mvec[u] and #mvec[v]$ et est défini par:
/ Sa direction: perpendiculaire au plan formé par $#mvec[u]$ et $#mvec[v]$.
/ Son sens: donné par la règle de la main droite.
/ Sa norme: $abs(#mvec[u] and #mvec[v]) = abs(#mvec[u]) dot abs(#mvec[v]) dot sin(theta)$
])[
#align(center)[
  #cetz.canvas({
  ortho(
    // x: 35.26deg,
    // y: 45deg,
    // z: 0deg,
    {
      let pcolor = black
      let A = (0, 0)
      let B = (8, 0)
      let C = (-1, 7)
      let D = (0, 0, 5)
      dvec(A, B, label: mvec[u], color: red, shrink: 0, rotate_label: false)
      dvec(A, C, label: mvec[v], color: blue, shrink: 0, rotate_label: false)
      dvec(A, D, label: mvec[$u and v$], color: green, shrink: 0, rotate_label: false)
      // 
      dangle3p(A, B, C, label: $theta$, radius:3, right: false)
      dangle3p(A, B, D, right: true, radius:.75)
      dangle3p(A, C, D, right: true, radius:.75)
    },
  )
})
]]

Le produit vectoriel de deux vecteurs $#mvec[u]$ et $#mvec[v]$ est un vecteur noté $#mvec[u] and #mvec[v]$ et est défini par:
/ Sa direction: perpendiculaire au plan formé par $#mvec[u]$ et $#mvec[v]$.
/ Son sens: donné par la règle de la main droite.
/ Sa norme: $abs(#mvec[u] and #mvec[v]) = abs(#mvec[u]) dot abs(#mvec[v]) dot sin(theta)$





// == Tests divers

// #showybox(
//   title: "Stokes' theorem",
//   frame: (
//     border-color: blue,
//     title-color: blue.lighten(30%),
//     body-color: blue.lighten(95%),
//     footer-color: blue.lighten(80%),
//   ),
//   footer: "Information extracted from a well-known public encyclopedia",
// )[
//   Let $Sigma$ be a smooth oriented surface in $RR^3$ with boundary $diff Sigma equiv Gamma$. If a vector field $bold(F)(x,y,z)=(F_x (x,y,z), F_y (x,y,z), F_z (x,y,z))$ is defined and has continuous first order partial derivatives in a region containing $Sigma$, then

//   $ integral.double_Sigma (bold(nabla) times bold(F)) dot bold(Sigma) = integral.cont_(diff Sigma) bold(F) dot dif bold(Gamma) $
// ]



// #cetz.canvas({
//   ortho(
//     {
//       let pcolor = black
//       let A = (0, 0)
//       let B = (8, 0)
//       let C = (-1, 7)
//       let D = (0, 0, 5)
//       dvec(A, B, label: mvec[AB], color: red, shrink: 0, rotate_label: false)
//       dvec(A, C, label: mvec[BC], color: blue, shrink: 0, rotate_label: false)
//       dvec(A, D, label: mvec[AD], color: green, shrink: 0, rotate_label: false)
//       dangle3p(A, B, C, label: $theta$, radius:3, right: false)
//       dangle3p(A, B, D, right: true, radius:.75)
//       dangle3p(A, C, D, right: true, radius:.75)
//     },
//   )
// })


// #theorem("vvv")