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

1. Quelle est  la vitesse du point $C$  appartenant à $(S_1)$ par rapport à $(S_0)$ notée $#mvec[V] (C in 1 slash 0)$ ?
2. Ecrire le vecteur position $#mvec[AI]$ du point $I$ par rapport à $frak(R)_0 $.
3. Calculer la vitesse du point $I in 1$ par rapport à $(S_0)$ par dérivation du vecteur position.
4. Calculer la vitesse du point $I in 1$ par rapport à $(S_0)$ par en utilisant la règle de Varignon. 
   Que pensez vous de ce résultat par rapport à celui de la question précédente ?
5. Quelle est la vitesse du point $I in 1$, le point coïncident avec $I$ appartenant à $(S_1)$ par rapport à $(S_0)$ notée $#mvec[V] (I in 1 slash 0)$ ?
6. Quelle est la vitesse du point $B$ appartenant à $(S_2)$ par rapport à $(S_0)$ notée $#mvec[V]  (B in 2 slash 0)$ ?



== Train d'engrenages
#note[Existe en version QCM dans l'examen de MECA591 2021-2022]

=== Enoncé

#figure(
  image("figures/cycloide.png", width: 70%),
  caption: [Train d'engrenages.],
) <train_engrenages>

#important[$#mvec[x]_0$ est noté $#mvec[x]$ et $#mvec[y]_0$ est noté $#mvec[y]$ sur le schéma.]

On s'intéresse au système représenté ci-dessus pour lequel on vous fournit les données suivantes:
- Soit  $ frak(R)_0 = (O, #mvec[x]_0, #mvec[y]_0,#mvec[z]_0)$ un repère fixe lie a un disque $S_0$ fixe de rayon $2R$ et de centre $O$. 
- Un solide $S_1$ assimilable à une tige $(O A = 3 R)$, de masse $m$ est animé 
      d'un mouvement de rotation autour du point $O$.  
- Un disque  $S_2$ de rayon $R$, de masse $m$ est articulé à $S_1$ au point $A$.
- Le repère $frak(R)_1 = (O, #mvec[x]_1, #mvec[y]_1,#mvec[z]_0)$ est un repère lie à $S_1$.
- Le repère $frak(R)_2 = (A, #mvec[x]_2, #mvec[y]_2,#mvec[z]_0)$ est un repère lie à $S_2$.
- $alpha_1$  est l'angle $(#mvec[x]_0, #mvec[x]_1)$.
- $alpha_2$  est l'angle $(#mvec[x]_1, #mvec[x]_2)$.
- $I$ est le point de contact entre $S$ et $S_2$.


=== Questions

1. Quelle est la vitesse $#mvec[ $Omega$ ] (2 slash 1)$ ?
2. Quelle est la vitesse $#mvec[ $Omega$ ] (2 slash 0)$ ? 
3. Quelle est la vitesse du point $A$ appartenant à $S_1$  par rapport à $frak(R)_0$ notée $#mvec[V] (A in 1 slash 0)$ ?
4. Quelle est la vitesse du point $I$ appartenant à $S_2$  par rapport à $frak(R)_0$ notée $#mvec[V] (I in 2 slash 0)$ ?
5. Quelle est l'accélération du point $G_1$ appartenant à $S_1$ par rapport à $frak(R)_0$ notée $#mvec[A] (G_1 in 1 slash 0)$?
6. Quelle est la relation entre $accent(alpha, dot)_1$ et $accent(alpha, dot)_2$ pour que le roulement entre $S_2$ et $S_0$ en $I$ soit sans glissement.


#bibliography("../../biblio.bib", style: "institute-of-electrical-and-electronics-engineers", title: "Références")