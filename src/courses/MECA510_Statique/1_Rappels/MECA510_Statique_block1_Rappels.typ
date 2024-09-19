// TEMPLATE IMPORT
#import "../../../templates/conf.typ": conf, todo, comment, idea, note, important
#import "../../../templates/drawing.typ": dvec, dpoint, dangle3p, dimension_line, arotz90, arrnumprod, arrsub, anorm, normalize, rotmat2D, dispvcol, arradd, mvec
#import "@preview/unify:0.6.0": num, qty, numrange, qtyrange
#import "@preview/cetz:0.2.2"
#import "@preview/showybox:2.0.1": showybox
#import "@preview/chic-hdr:0.4.0": *
#import cetz.draw: *
#import "@preview/physica:0.9.3": *
#set math.equation(numbering: "(1)")

// DOCUMENT SETUP
#let course = "MECA510 - Statique"
#let block = "Notions indispensables sur les vecteurs et les torseurs"
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

Ce cours est destiné de futurs ingénieurs à coloration mécanique.
Il ne s'agit donc pas d'un cours de mathématiques, et notamment, il ne s'agit pas d'algèbre linéaire.
Cependant, les vecteurs sont un outil essentiel pour la mécanique, et il est donc nécessaire de rappeler quelques notions de base sur les vecteurs.
Si ce qui est présenté ici vous semble trop simple, c'est normal et c'est une bonne nouvelle, et vous pouvez passer à la suite.
Ceci dit, ce cours existe car l'expérience montre que les étudiants ont souvent des difficultés avec les vecteurs, et il est donc important de les rappeler.

= Formalisme & définitions

== Notion de vecteur

On considère ainsi qu'un vecteur $#mvec[V]$ est un object mathématique défini par 3 propriétés:
/ Sa direction: une droite $(D)$, par exemple.
/ Son sens: le sens de parcours de la droite parmi les deux possibles.
/ Sa norme: elle quantifie l'intensité du vecteur, est notée $abs(#mvec[V])$ et a une unité qui dépend de ce que représente le vecteur. Par exemple, un champ de vitesse aura une norme en #qty("", "m/s") et une force en #qty("", "N"). Un vecteur de norme 1 sans unité est un vecteur unitaire.


== Relations entre vecteurs et points

Dans tout le cours, on manipulera des points ($A$, $B$, ... ) et des vecteurs ($#mvec[u]$, $#mvec[AB]$, ...)#footnote[Voir #link("https://fr.wikipedia.org/wiki/Espace_affine")[espaces affines].]. 
On utilisera largement la propriété que si $B = A + #mvec[u]$, alors $#mvec[AB] = #mvec[u]$. 
Le vecteur $#mvec[AB]$ est le vecteur qui va de $A$ à $B$ et son unité est le #qty("", "m").


== Espace de travail

De même on travaillera dans l'espace réel à 3 dimensions auquel on ajoutera le temps qui sera le même dans tous les référentiels. 
On sera ainsi dans le cadre de la mécanique classique ou newtonienne. 

= Opération sur les vecteurs

== Addition et relation de Chasles

=== Addition de vecteurs

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

==== Relation de Chasles
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
C'est une relation très utile pour faire apparaître des points dans un calcul.
Par exemple, si on cherche le point $C$ tel que $#mvec[AC] = #mvec[AB] + #mvec[BC]$, on peut utiliser la relation de Chasles pour trouver $C$.



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
Au passage, on peut remarque que même si nous n'avons pas défini l'oppposé d'un vecteur, le produit vecteur nombre permet de le définir.

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

$ ( #mvec[u], #mvec[v], #mvec[w] ) & = (#mvec[u] and #mvec[v]) dot  #mvec[w] $

Il a des propriétés similaires au produit vectoriel:
- Il est anti-commutatif: $( #mvec[u], #mvec[v], #mvec[w] ) = - ( #mvec[v], #mvec[u], #mvec[w] )$.
- Il est nul si $#mvec[u]$, $#mvec[v]$ et $#mvec[w]$ sont coplanaires, c'est donc un outil parfait pour déterminer si 3 vecteurs forment un tétraèdre dégénéré, c'est-à-dire de volume nul.
- Sa norme correspond à 6 fois le volume du tétraèdre $"ABCD"$ formé par $#mvec[u]$, $#mvec[v]$ et $#mvec[w]$.
- C'est aussi le déterminant de la matrice formée par les 3 vecteurs.


= Bases, repères & coordonnées

== Bases

D'un point de vue mathématique, une base est un ensemble de vecteurs linéairement indépendants qui, en les combinant linéairement permettent de retrouver tout vecteur de l'espace.
Nous avons fait l'hypothèse que l'espace est de dimension 3, et nous avons donc besoin de 3 vecteurs $(#mvec[x], #mvec[y], #mvec[z])$ pour construire une base.
Tout vecteur $#mvec[v]$ de l'espace peut être défini par une combinaison linéaire de ces 3 vecteurs, c'est-à-dire sous la forme:

$ #mvec[v] = a #mvec[x] + b #mvec[y] + c #mvec[z] $

Si les vecteurs de la base sont linéairement indépendants, ce qui dans le cas présent revient à dire que leur produit mixte est non nul:

$ ( #mvec[x], #mvec[y], #mvec[z] ) != 0 $

Mathématiquement, nous n'avons pas besoin de plus pour définir une base $cal(B) = (#mvec[x], #mvec[y] #mvec[z])$. 
Dans la pratique, nous choisirons systématiquement d'aller un peu plus loin en supposant que les bases que nous utilisons sont orthonormées directes, c'est-à-dire que:

- Les vecteurs de la base sont unitaires: $norm(#mvec[x]) = norm(#mvec[y]) = norm(#mvec[z]) = 1$
- Ils sont orthogonaux 2 à 2: $#mvec[x] and #mvec[y] = #mvec[y] and #mvec[z] = #mvec[z] and #mvec[x] = 0$
- Ils forment un repère direct: $( #mvec[x], #mvec[y], #mvec[z] ) > 0$.

Enfin, surtout dans un contexte cinématiques, nous serons souvent ammenés à utiliser des plusieurs bases, et il sera alors nécessaire de préciser à quelle base appartient un vecteur.
Nous choisissons de numéroter les solides de $0$ à $N$ et donc d'attribuers au solide $i$ une base $cal(B)_i = (#mvec[x]_i, #mvec[y]_i, #mvec[z]_i)$.

== Coordonnées

#let v = ("a", "b", "c")

Les coordonnées d'un vecteur $#mvec[v]$ dans une base $cal(B)_i = (#mvec[x]_i, #mvec[y]_i, #mvec[z]_i)$ sont les coefficients $a$, $b$ et $c$ de la combinaison linéaire qui permet d'écrire $#mvec[v]$:

$ #mvec[v] = a #mvec[x]_i + b #mvec[y]_i + c #mvec[z]_i $

Dans tout le cours nous utiliserons la notation:

 $ #mvec[v] = #dispvcol(v, basis:"i") = a #mvec[x]_i + b #mvec[y]_i + c #mvec[z]_i $ 
 
Pour indiquer que les coordonnées de $#mvec[v]$ dans la base $cal(B)_i$ sont $(a, b, c)$. 
La @vector_coordinates[figure] illustre cette notion.

#figure(
 align(center)[
  #cetz.canvas({
    ortho(
    x: 20deg,
    y: 30deg,
    // z: 0deg,
    {
      let O = (0, 0, 0)
      let x = (3, 0, 0)
      let y = (0, 3, 0)
      let z = (0, 0, 3)
      let vx = (5, 0, 0)
      let vy = (0, 8, 0)
      let vz = (0, 0, 13)
      let vxy = arradd(vx, vy)
      let v = arradd(vxy, vz)

      // dpoint(O0, label: [$O_0$], anchor: "north")
      line(O, (5.2, 0, 0), stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      line(O, (0, 8.2, 0), stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      line(vx, vxy, stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      line(vy, vxy, stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      dvec(O, x, label: [$#mvec[x]_i$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O, y, label: [$#mvec[y]_i$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O, z, label: [$#mvec[z]_i$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O, v, label: [$#mvec[v]$], color: blue, shrink: 4pt, rotate_label: false)
      dvec(O, arradd(vx, vy), label: [$a #mvec[x]_i + b #mvec[y]_i $], color: red, shrink: 0pt, rotate_label: false)
      dvec(arradd(vx, vy), v, label: [$c #mvec[z]_i $], color: maroon, shrink: 0pt, rotate_label: false)
      dimension_line(O, vx, label: [$a$], inv: true, offs: 2, ratio: 90%)
      dimension_line(O, vy, label: [$b$], inv: false, offs: 4, ratio: 90%)
      dangle3p(vx, O, vxy, right: true, radius:.5)
      dangle3p(vy, O, vxy, right: true, radius:.5)
      dangle3p(vxy, v, O, right: true, radius:.75)
    },
  )
  })
], 
caption: "Illustration des coordonnées d'un vecteur dans une base.",
placement: top,
)<vector_coordinates>


Les coordonnées d'un vecteur dans une base peuvent se calculer facilement en utilisant le produit scalaire. 
En effet, si $#mvec[v] = a #mvec[x]_i + b #mvec[y]_i + c #mvec[z]_i $, alors:

$ #mvec[v] dot #mvec[x]_i & = (a #mvec[x]_i + b #mvec[y]_i + c #mvec[z]_i) dot  #mvec[x]_i \
& = a ( underbrace(#mvec[x]_i dot #mvec[x]_i, 1)) 
+ b ( underbrace(#mvec[y]_i dot #mvec[x]_i, 0)) 
+ c ( underbrace(#mvec[z]_i dot #mvec[x]_i, 0)) \
& = a $

Il suffit dont ce multiplier scalairement un vecteur par chaque vecteur de la base pour obtenir les coordonnées de ce vecteur celle-ci.


== Opérations sur les coordonnées des vecteurs

On peut réécrire les opérations entre vecteurs et nombres en utilisant les coordonnées des vecteurs dans une même base. 
On considère 3 vecteurs $#mvec[v]$ et $#mvec[w]$ et $#mvec[u]$ , un nombre $lambda$ et une base $cal(B)$ qui vérifient:

#let w = ("d", "e", "f")
#let u = ("g", "h", "i")

$ #mvec[v] = #dispvcol(v, basis:"i") " ; " #mvec[w] = #dispvcol(w, basis:"i") " et " #mvec[w] = #dispvcol(u, basis:"i") $

=== Addition de vecteurs

$ #mvec[v] + #mvec[w] = #dispvcol( ($a+d$, $b+e$, $d+f$)  , basis:"i") $

=== Produit vecteur nombre

$ lambda #mvec[v] = #dispvcol( ($lambda a$, $lambda b$, $lambda c$)  , basis:"i") $

=== Produit scalaire

$ #mvec[v] dot #mvec[w] = #dispvcol(v, basis:"i") dot #dispvcol(w, basis:"i") = a d + b e + c f $

=== Produit vectoriel

$ #mvec[v] and #mvec[w] = #dispvcol(v, basis:"i") and  #dispvcol(w, basis:"i") = #dispvcol( ($b f - c e$, $c d - a f$, $a e - b d$)  , basis:"i") $

=== Produit mixte

$ ( #mvec[v], #mvec[w], #mvec[u] ) = #dispvcol(v, basis:"i") dot #dispvcol(w, basis:"i") dot #dispvcol(u, basis:"i") = a e i + b f g + c d h - ( a f h + b d i + c e g ) $

// == Changement de base

// A faire

== Repères

Un repère est une une base $cal(B)_i$ à laquelle on a ajouté un point d'origine $O_i$, on l'écrit alors $cal(R)_i = (O_i, #mvec[x]_i, #mvec[y]_i, #mvec[z]_i)$. 
Le repère permet de définir les coordonnées de points dans l'espace au travers du vecteur position.
Un point $M$ a des coordonnées $(x, y, z)$ dans le repère $cal(R)_i$ si le vecteur position $#mvec[$O_i$ M] = x #mvec[x]_i + y #mvec[y]_i + z #mvec[z]_i$.


#figure(
 align(center)[
  #cetz.canvas({
    ortho(
    x: 20deg,
    y: 30deg,
    // z: 0deg,
    {
      let O = (0, 0, 0)
      let x = (3, 0, 0)
      let y = (0, 3, 0)
      let z = (0, 0, 3)
      let vx = (5, 0, 0)
      let vy = (0, 8, 0)
      let vz = (0, 0, 13)
      let vxy = arradd(vx, vy)
      let v = arradd(vxy, vz)

  
      line(O, (5.2, 0, 0), stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      line(O, (0, 8.2, 0), stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      line(vx, vxy, stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      line(vy, vxy, stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      dvec(O, x, label: [$#mvec[x]_i$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O, y, label: [$#mvec[y]_i$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O, z, label: [$#mvec[z]_i$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O, v, label: [$#mvec[$O_i$ M]$], color: blue, shrink: 4pt, rotate_label: false)
      dvec(O, arradd(vx, vy), label: [$x #mvec[x]_i + y #mvec[y]_i $], color: red, shrink: 0pt, rotate_label: false)
      dvec(arradd(vx, vy), v, label: [$z #mvec[z]_i $], color: maroon, shrink: 0pt, rotate_label: false)
      dimension_line(O, vx, label: [$x$], inv: true, offs: 2, ratio: 90%)
      dimension_line(O, vy, label: [$y$], inv: false, offs: 4, ratio: 90%)
      dangle3p(vx, O, vxy, right: true, radius:.5)
      dangle3p(vy, O, vxy, right: true, radius:.5)
      dangle3p(vxy, v, O, right: true, radius:.75)
      dpoint(O, label: [$O_i$], anchor: "north-west")
      dpoint(v, label: [$M$], anchor: "north-east")
    },
  )
  })
], 
caption: [Illustration du vecteur position d'un point $M$ dans un repère $cal(R)_i$.],
placement: top,
)<point_coordinates>






= Champs de vecteurs

Un champ de vecteur est une fonction qui associe un vecteur $#mvec[v]$ à une position $M$ de l'espace $ #mvec[$O_i$ M]$ et au temps $t$:

$ #mvec[v]:= cases(bb(R)^3 times bb(R) arrow.r.long bb(R)^3,
(M, t) arrow.r.long.bar #mvec[v] (M, "t") ) $

En mécanique, un champ de vitesse, de force ou de déplacement sont des exemples de champs de vecteurs.
Pour les calculer, on a besoin alternativement de caractériser leurs variations par rapport au temps ou à l'espace. 
On dira d'un champ de vecteur qu'il est:
/ Constant: si ses coordonnées ne dépendent pas du temps.
/ Uniforme: si ses coordonnées ne dépendent pas de la position. 



== Dérivation par rapport au temps

=== Vision naïve

On s'intéresse à un vecteur $#mvec[v]$ qui dépend du temps $t$. 
On connait ses coordonnées dans base $cal(B)_i$:

$ #mvec[v] = #dispvcol(v, basis:"i") $

Par commodité, nous ne ferons pas apparaître explicitement la dépendance en $t$ des coordonnées de $#mvec[v]$.
On a donc naturellement envie de définir la dérivée de $#mvec[v]$ par rapport au temps $t$:

#let dotv = ($dot(a)$, $dot(b)$, $dot(c)$)

$ dv( #mvec[v], t)  = #dispvcol(dotv, basis:"i") $

Où $dot(a) = dv(a, t)$. 
On remarque que la dérivée d'un vecteur par rapport au temps ne semble pas unique. 
En effet, elle semble dépendre de la base.
A titre d'exemple, si on construit une base dont le vecteur $#mvec[v]$ fait partie et que sa norme ne dépend pas du temps, alors la dérivée de $#mvec[v]$ par rapport au temps est nulle de ce point de vue.

=== Vision plus rigoureuse

#figure(
 align(center)[
  #cetz.canvas({
    ortho(
    x: 20deg,
    y: 30deg,
    // z: 0deg,
    {
      let O = (0, 0, 0)
      let x = (3, 0, 0)
      let y = (0, 3, 0)
      let z = (0, 0, 3)
      let vx = (5, 0, 0)
      let vy = (0, 8, 0)
      let vz = (0, 0, 13)
      let vxy = arradd(vx, vy)
      let v = arradd(vxy, vz)
      let dv = (1, 2, 7)
      let v2 = arradd(v, dv)

      // dpoint(O0, label: [$O_0$], anchor: "north")
      // line(O, (5.2, 0, 0), stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      // line(O, (0, 8.2, 0), stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      // line(vx, vxy, stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      // line(vy, vxy, stroke: (paint: black, thickness: 1pt, dash: "dashed"))
      dvec(O, x, label: [$#mvec[x]_i$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O, y, label: [$#mvec[y]_i$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O, z, label: [$#mvec[z]_i$], color: green, shrink: 0, rotate_label: false, thickness: 1pt)
      dvec(O, v, label: [$#mvec[v] (t)$], color: blue, shrink: 4pt, rotate_label: false)
      dvec(O, v2, label: [$#mvec[v] (t + dd(t))$], color: red, shrink: 4pt, rotate_label: false)
      dvec(v, v2, label: [$dd(#mvec[v])$], color: maroon  , shrink: 4pt, rotate_label: false)
      // dvec(O, arradd(vx, vy), label: [$a #mvec[x]_i + b #mvec[y]_i $], color: red, shrink: 0pt, rotate_label: false)
      // dvec(arradd(vx, vy), v, label: [$c #mvec[z]_i $], color: maroon, shrink: 0pt, rotate_label: false)
      // dimension_line(O, vx, label: [$a$], inv: true, offs: 2, ratio: 90%)
      // dimension_line(O, vy, label: [$b$], inv: false, offs: 4, ratio: 90%)
      // dangle3p(vx, O, vxy, right: true, radius:.5)
      // dangle3p(vy, O, vxy, right: true, radius:.5)
      // dangle3p(vxy, v, O, right: true, radius:.75)
    },
  )
  })
], 
caption: "Illustration de la dérivation d'un vecteur dans une base.",
placement: top,
)<vector_derivative>

L'expérience faite ci-dessus montre que la dérivée d'un vecteur par rapport au temps n'est pas unique.
En fait, un vecteur peut changer par rapport au temps de 2 façons:
/ Sa norme peut changer: cette transformation est identique quelle que soit la base depuis laquelle on la considère.
/ Sa direction peut changer: cette transformation dépend de la base depuis laquelle on la considère.

On en conclut que la dérivée d'un vecteur par rapport au temps ne peut être écrite que si on précise par rapport à quelle base on la calcule, ou plus précisément, quelle base on considère comme fixe lors de ce calcul.

On définit donc la dérivée d'un vecteur $#mvec[v]$ par rapport au temps $t$ dans la base $cal(B)_i$ comme:

$ (dv( #mvec[v], t))_i  = #dispvcol(dotv, basis:"i") $

La @vector_derivative[figure] illustre cette notion.
On peut en déduire des idées fondamentales pour la suite du cours:
- La composante de la dérivée du vecteur qui est colinéaire avec lui même traduit une variation de sa norme. Ainsi, une accélération colinéaire à la vitesse d'un point veut dire qu'il augmente sa vitesse sans en changer la direction si elles sont dans le même sens.
- La composante de la dérivée du vecteur qui est perpendiculaire à lui même traduit une variation de sa direction. Ainsi, une accélération perpendiculaire à la vitesse d'un point veut dire qu'il change de direction sans changer la norme de sa vitesse. 

=== Relations entre bases et formule de Bour

#let vrot(i, j) = $#mvec( $Omega $ ) ( #i slash #j )$

On a vu que la dérivée d'un vecteur par rapport au temps dépend de la base dans laquelle on la calcule.
On peut cependant établir des relations entre les dérivées d'un vecteur dans différentes bases.
On considère ainsi 2 bases $cal(B)_i$ et $cal(B)_j$ et un vecteur $#mvec[v]$.
La formule de Bour nous permet d'écrire que:

$ (dv( #mvec[v], t))_j  = (dv( #mvec[v], t))_i + #vrot("i", "j" ) and #mvec[v] $<formule_bour>

Le corollaire est que pour un vecteur unitaire dont la norme est de 1 ne varie donc pas, on a:

$ (dv( #mvec[x]_i, t))_j  = #vrot("i", "j" ) and #mvec[x]_i $<formule_bour_unitaire>

Les @formule_bour et @formule_bour_unitaire sont fondamentales pour la cinématique.

== Variations par rapport à l'espace

=== Champ équiprojectif

Un champ est équiproject si:  

$ forall A, B:  #mvec[v] ("A") dot #mvec[$A B$] = #mvec[v] ("B") dot #mvec[$A B$] $

Un tel champ est le champ de moment d'un torseur.


= Torseurs

Un torseur est un formalisme mathématique qui permet de manipuler les champs de vecteurs équiprojectifs.
En mécanique, il existe 4 types de champs équiprojectifs et donc de torseurs:
- Les couples engendrés par les forces.
- Les vitesses des points appartenant à des solides indéformables.
- Les quantités de mouvement des solides indéformables.
- Les quantités d'accélération des solides indéformables.


