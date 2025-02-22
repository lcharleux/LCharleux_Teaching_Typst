// TEMPLATE IMPORT
#import "../../templates/conf.typ": conf, todo, comment, idea, note, important
#import "../../templates/drawing.typ": dvec, dpoint, dangle3p, dimension_line, arotz90, arrnumprod, arrsub, anorm, normalize, rotmat2D, dispvcol, arradd, mvec, arrcrossprod, arrdotprod, torseur1, torseur2, torseur6, part_label
#import "@preview/unify:0.6.0": num, qty, numrange, qtyrange
#import "@preview/cetz:0.2.2"
#import "@preview/showybox:2.0.1": showybox
#import "@preview/chic-hdr:0.4.0": *
#import cetz.draw: *
#import "@preview/physica:0.9.3": *
#set math.equation(numbering: "(1)")

// DOCUMENT SETUP
#let course = "MECA512: Cinématique"
#let block = "Cinématique des solides indéformables"
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

#todo[MAJ du cours]

= Exercices

== Système à cames

#note[Existe en version QCM dans l'examen de MECA591 2022-2023]

=== Enoncé
#figure(
  image("figures/systeme_came.png", width: 55%),
  caption: [Système à cames.],
) <systeme_came>

On s'intéresse maintenant à la cinématique d'un système à came utilisé pour la distribution dans moteur à explosion.
Il est constitué de 3 solides:
- Le solide $(S_0)$ qui joue le rôle de bâti.
  On lui associe le repère $frak(R)_0 = (A, #mvec[x]_0, #mvec[y]_0,#mvec[z]_0)$
- Le solide $(S_1)$ qui représente l'arbre à came.
  Il est supposé être un disque de centre $C$, de rayon $R$, d'épaisseur $h$, de masse volumique $rho $ et de masse $m_1$.
  Il est en pivot avec $(S_0)$ par rapport à l'axe $(A, #mvec[z]_0)$.
  La distance $A C = e$ est l'excentricité de la came, elle conditionne l'amplitude du mouvement que le système produit.
  On lui associe le repère $frak(R)_1 = (A, #mvec[x]_1, #mvec[y]_1,#mvec[z]_0)$.
- Et enfin le solide $(S_2)$ qui représente la soupape.
  Le solide $(S_2)$ est en liaison ponctuelle avec le solide $(S_1)$ en $I$.
  Cette dernière est supposée parfaite et donc sans frottement.
  En pratique, cette liaison est lubrifiée en permanence pour assurer le fonctionnement du moteur.
  On suppose qu'il existe un dispositif qui plaque les deux solides l'un sur l'autre de sorte que cette liaison reste active.
  Cette fonction est généralement assuré par un ressort.
  Enfin, le solide $(S_2)$ est en liaison glissière d'axe $#mvec[y]_0$ par rapport à $(S_0)$.
  On lui associe le repère $frak(R)_2 = (B, #mvec[x]_0, #mvec[y]_0, #mvec[z]_0)$.


On note $alpha$ l'angle $(#mvec[x]_0, #mvec[x]_1)$.
La vitesse de rotation de $(S_1)$ par rapport à $(S_0)$ est $Omega (1 slash 0)  = accent(alpha, dot) #mvec[z]_0$.


=== Questions

1. Quelle est la vitesse du point $C$ appartenant à $(S_1)$ par rapport à $(S_0)$ notée $#mvec[V] (C in 1 slash 0)$ ?
2. Ecrire le vecteur position $#mvec[AI]$ du point $I$ par rapport à $frak(R)_0 $.
3. Calculer la vitesse du point $I in 1$ par rapport à $(S_0)$ par dérivation du vecteur position.
4. Calculer la vitesse du point $I in 1$ par rapport à $(S_0)$ par en utilisant la règle de Varignon.
  Que pensez vous de ce résultat par rapport à celui de la question précédente ?
// 5. Quelle est la vitesse du point $I in 1$, le point coïncident avec $I$ appartenant à $(S_1)$ par rapport à $(S_0)$ notée $#mvec[V] (I in 1 slash 0)$ ?
5. Quelle est la vitesse du point $B$ appartenant à $(S_2)$ par rapport à $(S_0)$ notée $#mvec[V]  (B in 2 slash 0)$ ?



== Train d'engrenages
#note[Existe en version QCM dans l'examen de MECA591 2021-2022]

=== Enoncé

#figure(
  image("figures/cycloide.png", width: 70%),
  caption: [Train d'engrenages.],
) <train_engrenages>

#important[$#mvec[x]_0$ est noté $#mvec[x]$ et $#mvec[y]_0$ est noté $#mvec[y]$ sur le schéma.]

On s'intéresse au système représenté ci-dessus pour lequel on vous fournit les données suivantes:
- Soit $ frak(R)_0 = (O, #mvec[x]_0, #mvec[y]_0,#mvec[z]_0)$ un repère fixe lie a un disque $S_0$ fixe de rayon $2R$ et de centre $O$.
- Un solide $S_1$ assimilable à une tige $(O A = 3 R)$, de masse $m$ est animé
  d'un mouvement de rotation autour du point $O$.
- Un disque $S_2$ de rayon $R$, de masse $m$ est articulé à $S_1$ au point $A$.
- Le repère $frak(R)_1 = (O, #mvec[x]_1, #mvec[y]_1,#mvec[z]_0)$ est un repère lie à $S_1$.
- Le repère $frak(R)_2 = (A, #mvec[x]_2, #mvec[y]_2,#mvec[z]_0)$ est un repère lie à $S_2$.
- $alpha_1$ est l'angle $(#mvec[x]_0, #mvec[x]_1)$.
- $alpha_2$ est l'angle $(#mvec[x]_1, #mvec[x]_2)$.
- $I$ est le point de contact entre $S$ et $S_2$.


=== Questions

1. Quelle est la vitesse $#mvec[ $Omega$ ] (2 slash 1)$ ?
2. Quelle est la vitesse $#mvec[ $Omega$ ] (2 slash 0)$ ?
3. Quelle est la vitesse du point $A$ appartenant à $S_1$ par rapport à $frak(R)_0$ notée $#mvec[V] (A in 1 slash 0)$ ?
4. Quelle est la vitesse du point $I$ appartenant à $S_2$ par rapport à $frak(R)_0$ notée $#mvec[V] (I in 2 slash 0)$ ?
5. Quelle est l'accélération du point $G_1$ appartenant à $S_1$ par rapport à $frak(R)_0$ notée $#mvec[A] (G_1 in 1 slash 0)$?
6. Quelle est la relation entre $accent(alpha, dot)_1$ et $accent(alpha, dot)_2$ pour que le roulement entre $S_2$ et $S_0$ en $I$ soit sans glissement.


== Réducteur à billes

#note[Cet exercice est inspiré de #cite(<agati2020mecanique>, form:"full") page 91.]

#align(center)[
  #cetz.canvas({
    let O = (0, 0, 0)
    let C = (0, 5, 0)
    let R = 1
    let beta = 30deg
    let A1 = (-calc.sqrt(2) / 2 * R, C.at(1) - calc.sqrt(2) / 2 * R, 0)
    let A2 = (calc.sqrt(2) / 2 * R, C.at(1) - calc.sqrt(2) / 2 * R, 0)
    let A3 = (-calc.sqrt(2) / 2 * R, C.at(1) + calc.sqrt(2) / 2 * R, 0)
    let A4 = (calc.cos(beta) * R, C.at(1) + calc.sin(beta) * R, 0)
    let bold = 2pt
    let light = .5pt
    let fat = 3pt
    let nhatch = 8
    let xoff = .25
    let x1 = .125
    let x = (2, 0, 0)
    let y = (0, 2, 0)
    
    circle(C, radius: R, stroke: (paint: green, thickness: bold), fill: none)
    line(O, (0, 7, 0), stroke: (paint: gray, thickness: light))
    line( (-5, C.at(1), 0), (5.5, C.at(1), 0), stroke: (paint: gray, thickness: light))
    line((-3, 0, 0), (-xoff, 0, 0), stroke: (paint: blue, thickness: bold))
    line((-2.5, .25, 0), (-1.5, .25, 0), stroke: (paint: black, thickness: bold))
    line((-2.5, -.25, 0), (-1.5, -.25, 0), stroke: (paint: black, thickness: bold))
    line((-2.75, .25, 0), (-2.75, -.25, 0), stroke: (paint: blue, thickness: bold))
    line((-1.25, .25, 0), (-1.25, -.25, 0), stroke: (paint: blue, thickness: bold))
    line((-2, -.25, 0), (-2, -1, 0), stroke: (paint: black, thickness: bold))
    line((-2.5, -1, 0), (-1.5, -1, 0), stroke: (paint: black, thickness: bold))
    for i in range(nhatch + 1) {
      let P = (-2.5 + i / nhatch, -1, 0)
      let Q = (-2.75 + i / nhatch, -1.25, 0)
      line(P, Q, stroke: (paint: black, thickness: light))
    }
    {
      let P1 = (0, C.at(1) - calc.sqrt(2) * R, 0)
      let P2 = (-calc.sqrt(2) * R + x1, C.at(1) - x1, 0)
      let P3 = (-xoff, P1.at(1) + xoff, 0)
      line((-xoff, 0, 0), P3, stroke: (paint: blue, thickness: bold), name: "d1")
      // line(P1, P2, stroke: (paint: black, thickness: light))
      // dpoint(P3, label: [$P_3$], anchor: "north-west")
      line(P3, P2, stroke: (paint: blue, thickness: bold))
    }
    {
      let P1 = (0, C.at(1) - calc.sqrt(2) * R, 0)
      let P2 = (calc.sqrt(2) * R - x1, C.at(1) - x1, 0)
      let P3 = (xoff, P1.at(1) + xoff, 0)
      line((xoff, 0, 0), P3, stroke: (paint: red, thickness: bold), name: "d1")
      // line(P1, P2, stroke: (paint: black, thickness: light))
      // dpoint(P3, label: [$P_3$], anchor: "north-west")
      line(P3, P2, stroke: (paint: red, thickness: bold))
    }
    {
      let P1 = (0, C.at(1) + calc.sqrt(2) * R, 0)
      let P2 = (-calc.sqrt(2) * R + x1, C.at(1) + x1, 0)
      let P3 = (-xoff, P1.at(1) - xoff, 0)
      line((-xoff, 7.5, 0), P3, stroke: (paint: black, thickness: bold), name: "d1")
      // line(P1, P2, stroke: (paint: black, thickness: light))
      // dpoint(P3, label: [$P_3$], anchor: "north-west")
      line(P3, P2, stroke: (paint: black, thickness: bold))
    }
    {
      let P1 = (0, C.at(1) + (calc.cos(beta) + calc.cos(beta) / calc.tan(beta))* R, 0)
      let P2 = (calc.cos(beta) * R + xoff * calc.sin(beta), C.at(1) + calc.sin(beta)*R - xoff, 0)
      let P3 = (xoff, P1.at(1) - xoff / calc.sin(beta), 0)
      line((xoff, 7.5, 0), P3, stroke: (paint: black, thickness: bold), name: "d1")
      // line(P1, P2, stroke: (paint: black, thickness: light))
      // dpoint(P3, label: [$P_3$], anchor: "north-west")
      line(P3, P2, stroke: (paint: black, thickness: bold))
      let R2 = 3.
      let P4 = (R2 * calc.cos(beta), C.at(1) + R2 * calc.sin(beta))
      line(C, P4, stroke: (paint: gray, thickness: light))
      dangle3p(C, (3, C.at(1), 0), P4, right: false, radius: 3., color: green, label: [$phi$])
    }
    line((-xoff, 7.5, 0), (xoff, 7.5, 0), stroke: (paint: black, thickness: bold))
    line((0, 7.5, 0), (0, 8, 0), stroke: (paint: black, thickness: bold))
    line((0, 8, 0), (-2, 8, 0), stroke: (paint: black, thickness: bold))
    line((-2, 8, 0), (-2, .25, 0), stroke: (paint: black, thickness: bold))
    line((xoff, 0, 0), (3, 0, 0), stroke: (paint: red, thickness: bold))
    line((2.5, .25, 0), (1.5, .25, 0), stroke: (paint: black, thickness: bold))
    line((2.5, -.25, 0), (1.5, -.25, 0), stroke: (paint: black, thickness: bold))
    line((2.75, .25, 0), (2.75, -.25, 0), stroke: (paint: red, thickness: bold))
    line((1.25, .25, 0), (1.25, -.25, 0), stroke: (paint: red, thickness: bold))
    line((2, -.25, 0), (2, -1, 0), stroke: (paint: black, thickness: bold))
    line((2.5, -1, 0), (1.5, -1, 0), stroke: (paint: black, thickness: bold))
    for i in range(nhatch + 1) {
      let P = (2.5 - i / nhatch, -1, 0)
      let Q = (2.75 - i / nhatch, -1.25, 0)
      line(P, Q, stroke: (paint: black, thickness: light))
    }
    part_label((-2, 2), $0$, color: black, anchor: "east")
    part_label((-xoff, 2), $1$, color: blue, anchor: "east")
    part_label((xoff, 2), $2$, color: red, anchor: "west")
    part_label(C, $3$, color: green, anchor: "south-east")
    dpoint(O, label: "O", anchor: "north")
    dpoint(C, label: [C], anchor: "north-west")
    dpoint(A1, label: [$A_1$], anchor: "north-east")
    dpoint(A2, label: [$A_2$], anchor: "north-west")
    dpoint(A3, label: [$A_3$], anchor: "south-east")
    dpoint(A4, label: [$A_4$], anchor: "south-west")
    dvec((0, 8.25, 0), arradd((0, 8.25, 0), y), label: [$#mvec[y]_0$], color: green, shrink: 0, rotate_label: false, thickness: bold, padding: 4pt)
    dvec((3.25, 0, 0), arradd((3.25, 0, 0), x), label: [$#mvec[x]_0$], color: green, shrink: 0, rotate_label: false, thickness: bold, padding: 4pt)
    
    let u = normalize(arradd(A4, arrnumprod(A3, -1)))
    let P5 = arradd(A3, arrnumprod(u, 6))
    let P6 = arradd(A3, arrnumprod(u, -4))
    let P7 = (-5, C.at(1), 0)
    let k = (calc.sin(beta) - 1/calc.sqrt(2)) / (calc.cos(beta) + 1/calc.sqrt(2))
    let P8 = (R * calc.cos(beta) - calc.sin(beta) / k, C.at(1), 0)
    dpoint(P8, label: none, anchor: "south-west")
    line(A3, P5, stroke: (paint: gray, thickness: light))
    line(A3, P6, stroke: (paint: gray, thickness: light))
    dangle3p(P8, P6, P7, right: false, radius: 8., color: green, label: [$alpha$])
    dvec(P8, arradd(P8, arrnumprod(u, 2)), label: [$#mvec[u]$], color: green, shrink: 0, rotate_label: false, thickness: bold, padding: 4pt)
  })
]

On s'intéresse au réducteur à bille représenté ci-dessus pour lequel on vous fournit les données suivantes:
- Soit $ frak(R)_0 = (O, #mvec[x]_0, #mvec[y]_0,#mvec[z]_0)$ un repère fixe lié au bâti $S_0$ considéré comme fixe.
- Un arbre moteur $S_1$ assimilable tourne à une vitesse $#mvec[ $ Omega $ ] (1 slash 0) = omega_1 #mvec[x]_0$.
- Un arbre de sortie $S_2$ assimilable à un disque de rayon $R$ tourne à une vitesse $#mvec[ $ Omega $ ] (2 slash 0) = omega_2 #mvec[x]_0$.
- Une bille de centre $C$ qui roule sans glisser en $A_1$, $A_2$, $A_3$ et $A_4$.
- On note $#mvec[OC] = r #mvec[y]_0$.
- Les angles $(#mvec[y]_0, #mvec[CA]_3) = (#mvec[CA]_1, -#mvec[y]_0) = (-#mvec[y]_0, #mvec[CA]_2) = pi / 4$ et $(#mvec[x]_0, #mvec[CA]_4) = phi = pi / 6$ et enfin on note $(#mvec[x]_0, #mvec[u]) = alpha$.


=== Questions
1. Montrer que la bille est en rotation autout de l'axe $(A_3, A_4)$ dans son mouvement par rapport à $(S_0)$.
2. On pose $#mvec[ $ Omega $ ] (3 slash 0) = omega_3 #mvec[u]$. Calculer les vitesses $#mvec[V] (A_1 in 3 slash 0)$ et $#mvec[V] (A_2 in 3 slash 0)$.
3. En déduire le rapport de réduction $omega_2 / omega_1$. Faire une application numérique.


== Transformation de mouvement par galet

#note[Cet exercice vient du CC2 de MECA591 pour l'année 2023-2024. Les questions sont formulées comme elles l'étaient dans l'examen.]

#figure(
  image("figures/systeme_levage.png", width: 50%),
  caption: [Transformation de mouvement par galet .],
) <systeme_levage>

Le mécanisme schématisé ci-contre est constitué:
		- d'un bâti $(S_0)$ auquel est lié le repère $ frak(R)_0 = (O, #mvec[x]_0, #mvec[y]_0,#mvec[z]_0)$.
		- d'un bras $(S_1)$ en liaison pivot d'axe $(O,#mvec[z]_0)$ avec le bâti.
		      Le repère $ frak(R)_1 = (O, #mvec[x]_1, #mvec[y]_1,#mvec[z]_0)$ est lié au solide $(S_1)$.
		      La rotation de $(S_1)$ par rapport à  $(S_0)$ est paramétrée par l'angle $alpha$.
		      On note $#mvec[OA] = a #mvec[x]_1$.
		- d'un galet cylindrique $(S_2)$ de rayon $r$, en liaison pivot d'axe $(A,#mvec[z]_0)$ avec le bras $(S_1)$.
		      Le repère $ frak(R)_2 = (O, #mvec[x]_2, #mvec[y]_2, #mvec[z]_0)$ est lié au solide $(S_2)$.
		      La rotation de $(S_2)$ par rapport à $(S_1)$ est paramétrée par l'angle $beta$.
		- d'une plate-forme (S3) en liaison glissière $(O,#mvec[y]_0)$ avec le bâti $(S_0)$.
		      On note $#mvec[OB] =  h #mvec[y]_0$ avec $h$ variable.
		      Enfin, $I$ est le point de contact entre $(S_2)$ et $(S_3)$.

=== Questions

1. Exprimer la vitesse de rotation entre $(S_1)$ et $(S_0)$ notée $#mvec[ $ Omega$] (1 slash 0 )$
2. Exprimer la vitesse de rotation entre $(S_2)$ et $(S_0)$ notée $#mvec[ $ Omega$] (2 slash 0 )$.
3. Exprimer la vitesse de rotation entre $(S_3)$ et $(S_0)$ notée $#mvec[ $ Omega$] (3 slash 0 )$.
4. Déterminer la vitesse du point $I$ appartenant à $(S_3)$ par rapport au repère $frak(R)_0$ notée $ #mvec[V] (I in 3 slash 0 )$.
5. Déterminer l'accélération du point $I$ appartenant à $(S_3)$ par rapport au repère $frak(R)_0$ notée $#mvec[A] (I in 3 slash 0 )$.
6. Déterminer la vitesse du point $A$ appartenant à $(S_1)$ par rapport au repère $frak(R)_0$ notée $ #mvec[V] (A in 1 slash 0 )$.
7. Déterminer l'accélération du point $A$ appartenant à $(S_1)$ par rapport au repère $frak(R)_0$ notée $#mvec[A] (A in 1 slash 0 )$.
8. Déterminer la vitesse du point $I$ appartenant à $(S_2)$ par rapport au repère $frak(R)_0$ notée $#mvec[V] (I in 2 / 0)$.
9. En déduire la vitesse du point I appartenant à $(S_3)$ par rapport à $(S_2)$ notée $#mvec[V] (I in 3 / 2)$.
10. On suppose maintenant que le galet $(S_2)$ roule sans glisser sur la plate-forme $(S_3)$. 
    Quelle est l'équation qui en découle ?
11. Déduisez en l'expression de  $accent(beta, dot)$ en fonction de $a$, $r$, $alpha$ et $accent(alpha, dot)$
12. Déduisez en l'expression de  $accent(h, dot)$ en fonction de $a$, $ alpha$ et $accent(alpha, dot)$.

== Réducteur Graham

#note[Cet exercice est inspiré de #cite(<agati2020mecanique>, form:"full") page 92.]

#figure(
  image("figures/graham.png", width: 100%),
  caption: [Réducteur Graham.],
) <graham>

Soit le réducteur de vitesse schématisé ci-dessus pour lequel on vous fournit les données suivantes:
- Soit $ frak(R)_1 = (O, #mvec[x], #mvec[y]_1,#mvec[z]_1)$  et $ frak(R)_2 = (A, #mvec[x]_2, #mvec[y]_2,#mvec[z]_1)$ deux repères liés au solide $S_1$ tels quel $#mvec[OA]$ ait même direction et sens que $#mvec[y]_1$.
- On pose $alpha = (#mvec[x], #mvec[x]_2)$ constant.
- On pose $#mvec[$Omega$] (S slash S_1) = omega #mvec[x]_2$.
- A l'extrémité de $(S)$ est fixée une roue dentée de $n$ dents qui engrenne avec une roue dentée de $n_2$ dents fixée à l'extrémité de $(S_2)$.
// - Le solide $S_1$ avec son repère associé $ frak(R)_1 = (O, #mvec[x], #mvec[y]_1,#mvec[z]_1)$ est en liaison pivot d'axe $(O,#mvec[x]_0)$ avec le bâti $S_0$.
// - Le solide $S_2$ avec en liaison pivot d'axe $(O,#mvec[x])$ avec le solide $S_0$. 
// - Le solide $S$ est en liaison pivot d'axe $(A,#mvec[x]_2)$ avec le solide $S_1$.


=== Questions

1. Exprimer le roulement sans glissement de $(S)$ sur $(S_3)$ aun point $I$ et déterminer $omega$ en fonction de $omega_1$.
2. Quelle relation obtient-on entre $omega_1$, $omega_2$ et $omega$ en utilisant la relation de roulement sans glissement entre les roues dentées ?
3. En déduire le rapport de réduction $omega_2 / omega_1$ en fonction de $lambda$.
4. Tacer la courbe du rapport de variation $omega_2 / omega_1$ en fonction de $lambda$ sachant que $n slash n_2 = 11 slash 38$, d = 55 mm et que $lambda$ varie entre 12 mm et 23 mm. 



== Bille sur plateau tournant

=== Enoncé

On considère un repère $frak(R)_0 = (O_0, #mvec[x]_0, #mvec[y]_0,#mvec[z]_0)$ lié à un solide $S_0$ considéré comme fixe et galiléen.
Un repère $frak(R)_1 = (O_0, #mvec[x]_1, #mvec[y]_1,#mvec[z]_0)$ est associé à un plateau $S_1$ de rayon $R$ en rotation uniforme autour de l'axe vertical $(O_0, #mvec[z]_0)$ par rapport à $S_0$ à une vitesse $#mvec[$Omega$] (1 slash 0) = omega #mvec[z]_0$.
À l'instant initial $t = #qty("0", "s")$, les deux repères sont confondus.
On ajoute au problème une bille $S_3$ considérée comme ponctuelle située au point $A$ qui glisse sans frottement sur le plateau $S_1$.
À $t=#qty("0", "s")$, la bille est placée de sorte que $ #mvec[$O_0 A$] = R #mvec[x]_0$ avec une vitesse $#mvec[V] (A in 3 slash 0, t=#qty("0", "s")) = -v_0 #mvec[x]_0$.
On considère uniquement le cas de la billes qui reste sur le plateau.

=== Questions

1. Faire un schéma du système en indiquant les repères et les vecteurs vitesse.
2. Exprimer la vitesse de la bille $A$ par rapport à $S_0$ notée $#mvec[V] (A in 3 slash 0)$ à chaque instant.
3. Exprimer l'accélération de la bille $A$ par rapport à $S_0$ notée $#mvec[A] (A in 3 slash 0)$ à chaque instant.
4. Exprimer le vecteeur #mvec[$O_0 A$] en fonction du temps, en déduire la nature de la trajectoire de $A$ dans $S_0$.
5. Quelle est la trajectoire du point $A$ dans $S_1$ ?
6. Exprimer la vitesse de la bille $A$ par rapport à $S_1$ notée $#mvec[V] (A in 3 slash 1)$ à chaque instant.
7. Exprimer l'accélération de la bille $A$ par rapport à $S_1$ notée $#mvec[A] (A in 3 slash 1)$ à chaque instant.
8. Comment expliquez vous que les deux trajetoires soient différentes ? 
9. Quelles applications voyez vous à ce résultat ?


#bibliography("../../biblio.bib", style: "institute-of-electrical-and-electronics-engineers", title: "Références")