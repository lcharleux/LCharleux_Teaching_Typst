mkdir doc
typst compile  src/courses/MECA510_Statique/1_rappels/MECA510_Statique_block1_Rappels.typ doc/MECA510_Statique_block1_Rappels.pdf --root=./
typst compile src/sandbox/demo.typ doc/demo.pdf --root=../../
typst compile  src/courses/MECA510_Statique/2_statique/MECA510_Statique_block2_Statique.typ doc/MECA510_Statique_block2_Statique.pdf --root=./