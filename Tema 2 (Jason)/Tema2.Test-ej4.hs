module Tema2.Test_ej4 where

import JasonHaskell
import Test.HUnit

main = runTestTT tests

tests =
  test
    [ "gano el 1" ~: expectAny (vallaMenosVencida form5 goles5) ["b"],
      "gano el 2" ~: expectAny (vallaMenosVencida form5 goles5_0) ["d"],
      "gano el 3" ~: expectAny (vallaMenosVencida form5 goles5_1) ["e"],
      "gano el 4" ~: expectAny (vallaMenosVencida form5 goles5_2) ["g"],
      "gano el 5" ~: expectAny (vallaMenosVencida form5 goles5_3) ["i"],
      "ganaron todos" ~: expectAny (vallaMenosVencida form5 goles5_4) ["b", "d", "e", "g", "i"],
      "ganaron todos sin goles" ~: expectAny (vallaMenosVencida form5 goles5_5) ["b", "d", "e", "g", "i"],
      "ganaron 3" ~: expectAny (vallaMenosVencida form5 goles5_7) ["b", "e", "g"],
      "gano solo" ~: expectAny (vallaMenosVencida form1 goles1) ["b"],
      "gano solo y no le convirtieron" ~: expectAny (vallaMenosVencida form1 goles1_0) ["b"]
    ]

-- Formulas
form1 = [ab]

form5 = [ab, cd, je, fg, hi]

-- Listas
ab = ("a", "b")

cd = ("c", "d")

je = ("j", "e")

fg = ("f", "g")

hi = ("h", "i")

-- goles
goles1 = [5]

goles1_0 = [0]

goles5 = [1, 2, 3, 4, 5]

goles5_0 = [2, 1, 3, 4, 5]

goles5_1 = [3, 2, 1, 4, 5]

goles5_2 = [4, 2, 3, 1, 5]

goles5_3 = [5, 2, 3, 4, 1]

goles5_4 = [4, 4, 4, 4, 4]

goles5_5 = [0, 0, 0, 0, 0]

goles5_6 = [0, 0, 10, 0, 0]

goles5_7 = [10, 11, 10, 10, 11]

-- FUNCIONES PARA TESTING, NO BORRAR
-- expectAny permite saber si el elemento que devuelve la función es alguno de los esperados
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)
