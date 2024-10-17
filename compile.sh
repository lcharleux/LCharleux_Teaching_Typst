rm -rf doc
mkdir doc
typst compile src/sandbox/demo.typ doc/demo.pdf --root=../../
typst compile  src/courses/MECA510-512_Rappels/MECA510-512_Rappels.typ doc/MECA510-512_Rappels.pdf --root=./
typst compile  src/courses/MECA510_Statique/MECA510_Statique.typ doc/MECA510_Statique.pdf --root=./
typst compile  src/courses/MECA512_Cinematique/MECA512_Cinematique.typ doc/MECA512_Cinematique.pdf --root=./