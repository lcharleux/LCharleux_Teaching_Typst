#import "@preview/chic-hdr:0.4.0": *



// UTILITY FUNCTIONS
#let todo = what => rect(fill: rgb("#f2726da1"), stroke: black)[*To do*: #what]
#let comment = what => rect(
  fill: rgb("#50b56aa1"),
  stroke: black,
)[*Comment*: #what]
#let idea = what => rect(fill: rgb("#4346aba1"), stroke: black)[*Ideas*: #what]
#let note = what => rect(fill: rgb("#bdb541a1"), stroke: black)[*Note*: #what]
#let important(what) = {
  rect(fill: rgb("#a44444a1"), stroke: black)[*Important*: #what]
}


// MATH FUNCTIONS

#let conf(
  course: none,
  block: none,
  section: none,
  teacher: none,
  email: none,
  doc,
) = {
  show figure.caption: set text(8pt)
  // set text(font: "PT Sans", size: 10pt)
  // set text(font: "Linux Libertine", size: 11pt)

  set par(justify: true)
  set heading(numbering: "1.a")
  show bibliography: set heading(numbering: "1")

  show bibliography: it => {
    set text(size: 7pt)
    show heading: set text(size: 12pt)
    it
  }
  show table.cell.where(x: 1): set text(weight: "medium")
  show table.cell.where(y: 0): set text(weight: "bold")
  // See the strokes section for details on this!
  let frame(stroke) = (
    (x, y) => (
      left: if x > 0 {
        0pt
      } else {
        stroke
      },
      right: stroke,
      top: if y < 2 {
        stroke
      } else {
        0pt
      },
      bottom: stroke,
    )
  )

  set table(fill: (rgb("EAF2F5"), none), stroke: frame(rgb("21222C")))
  // set page(footer: context [
  //   *Polytech Annecy Chambéry #sym.bar.h #course #sym.bar.h #block *
  //   #h(1fr)
  //   #counter(page).display("1/1", both: true)
  // ])
  place(top + left, image("pac.png", height: 1cm, fit: "contain"))
   place(top + right, image("USMB_logo.svg", height: 1cm, fit: "contain"))
  // align(center)[
  //   #text(12pt, luma(100))[
  //     Polytech Annecy Chambéry\
  //     #section
  //   ]
  // ]
  // box(
  //   stroke: black,
  //   inset: 1em,
  //   width: 1fr,
  // )[
  //   #text(10pt)[
  //     *Cours : #course* \
  //     *Bloc: #block* \
  //     *Enseignant : #teacher*
  //   ]
  // ]
  align(
    center + horizon,
    [
      #text(17pt)[*#course*] \
      #text(15pt)[#block] \
      #text(13pt)[#section]

  
        #align(center)[
          #teacher \
          #link("mailto:" + email, email) \
          Polytech Annecy Chambéry \
        ]
      #outline(title: "Plan du cours")
    ],
  )
  show link: this => {
    let show-type = "box" // "box" or "filled", see below
    let label-color = green
    let default-color = rgb("#6694ff")

    if show-type == "box" {
      if type(this.dest) == label {
        // Make the box bound the entire text:
        set text(bottom-edge: "bounds", top-edge: "bounds")
        box(this, stroke: label-color + 1pt)
      } else {
        set text(bottom-edge: "bounds", top-edge: "bounds")
        box(this, stroke: default-color + 1pt)
      }
    } else if show-type == "filled" {
      if type(this.dest) == label {
        text(this, fill: label-color)
      } else {
        text(this, fill: default-color)
      }
    } else {
      this
    }
  }

  show: chic.with(
    chic-footer(
      left-side: strong(
        link("mailto:" + email, email),
      ),
      right-side: chic-page-number(),
    ),
    chic-header(
      left-side: emph(chic-heading-name(fill: true)),
      right-side: smallcaps([#course]),
    ),
    chic-separator(1pt),
    chic-offset(7pt),
    chic-height(1.5cm),
  )

  doc
}


