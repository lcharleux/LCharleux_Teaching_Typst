mkdir doc
typst compile  src/courses/MECA510_Statique/1_rappels/MECA510_Statique_block1_Rappels.typ doc/MECA510_Statique_block1_Rappels.pdf --root=./
ghp-import -o -p -n -b=outputs doc