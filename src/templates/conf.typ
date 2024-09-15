



// UTILITY FUNCTIONS
#let todo = what => rect(fill: rgb("#f2726da1"), stroke: black)[*To do*: #what]
#let comment = what => rect(
  fill: rgb("#50b56aa1"),
  stroke: black,
)[*Comment*: #what]
#let idea = what => rect(fill: rgb("#4346aba1"), stroke: black)[*Ideas*: #what]
#let note = what => rect(fill: rgb("#bdb541a1"), stroke: black)[*Note*: #what]
#let important(what)={rect(fill: rgb("#a44444a1"), stroke: black)[*Important*: #what]}


// MATH FUNCTIONS

#let conf(
  course: none,
  block: none,
  section: none,
  teacher: [],
  lab: [],
  partner_labs: [],
  joint_demand: "NON",
  doc,
) = {
  show figure.caption: set text(8pt)
  set text(font: "PT Sans", size: 10pt)
  set par(justify: true)
  set heading(numbering: "1.a")
  show bibliography: set heading(numbering: "1")
  show heading.where(level: 1): it => (
    box(stroke: black, fill: gray, inset: .5em, width: 1fr)[
      #text(10pt)[#counter(heading).display(). #it.body ]
    ]
  )
  show heading.where(level: 2): it => (
    box(stroke: none, fill: none, inset: .5em)[
      #text(10pt)[#counter(heading).display() #it.body]
    ]
  )
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
  set page(footer: context [
    *Polytech Annecy Chambéry #sym.bar.h #course #sym.bar.h #block *
    #h(1fr)
    #counter(page).display("1/1", both: true)
  ])
  place(top + left, image("USMB_logo.svg", width: 3cm))
  align(center)[
    #text(12pt, luma(100))[
      Polytech Annecy Chambéry\
      #section
    ]
  ]
  box(
    stroke: black,
    inset: 1em,
    width: 1fr,
  )[
    #text(10pt)[
      *Cours : #course* \
      *Bloc: #block* \
      *Enseignant : #teacher*
    ]
  ]
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
  doc
}


