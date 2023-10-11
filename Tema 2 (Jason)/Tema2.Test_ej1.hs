module Tema2.Test_ej1 where

import JasonHaskell
import Test.HUnit

main = runTestTT tests

tests =
  test
    [ " equipos sin atajadas suplente sin goles" ~: atajaronSuplentes [] [] 0 ~?= 0,
      " equipos sin atajadas suplente con 1 goles" ~: atajaronSuplentes [] [] 1 ~?= 1,
      " equipos sin atajadas suplente con n goles" ~: atajaronSuplentes [] [] 3 ~?= 3,
      " no atajaron los suplentes" ~: atajaronSuplentes form5 goles5 15 ~?= 0,
      " sin atajadas en cero" ~: atajaronSuplentes form5 goles5 18 ~?= 3,
      " los titulares no atajaron" ~: atajaronSuplentes form5 goles5_0 22 ~?= 22,
      " algunos titulares no atajaron" ~: atajaronSuplentes form5 goles5_3 7 ~?= 6,
      " algunos titulares no atajaron2" ~: atajaronSuplentes form5 goles5_1 15 ~?= 3,
      " algunos titulares no atajaron3" ~: atajaronSuplentes form5 goles5_2 15 ~?= 5
    ]

-- Formulas
form5 = [ab, cd, je, fg, hi]

-- Listas
ab = ("a", "b")

cd = ("c", "d")

je = ("j", "e")

fg = ("f", "g")

hi = ("h", "i")

-- goles
goles5 = [1, 2, 3, 4, 5]

goles5_0 = [0, 0, 0, 0, 0]

goles5_1 = [1, 2, 0, 4, 5]

goles5_2 = [1, 2, 3, 4, 0]

goles5_3 = [0, 0, 1, 0, 0]
