module Tema2.Test_ej2 where

import JasonHaskell
import Test.HUnit

main = runTestTT tests

tests =
  test
    [ " arqueros vacios" ~: equiposValidos form0 ~?= True,
      -- 1 goleador
      " 1 goleador valido " ~: equiposValidos form1_t ~?= True,
      " 1 goleador invalido " ~: equiposValidos form1_f ~?= False,
      -- 5 arqueros
      " 5 arqueros validos " ~: equiposValidos forms_t ~?= True,
      " primer goleador invalido " ~: equiposValidos forms_1f ~?= False,
      " cuarto goleador invalido " ~: equiposValidos forms_4f ~?= False,
      " ultimo goleador invalido " ~: equiposValidos forms_5f ~?= False,
      " varios arqueros invalidos " ~: equiposValidos forms_245 ~?= False,
      -- repetidos club
      " mismo club f1 y f2 " ~: equiposValidos forms_12p ~?= False,
      " mismo club f1 y f4 " ~: equiposValidos forms_14p ~?= False,
      " mismo club f3 y f4 " ~: equiposValidos forms_34p ~?= False,
      " mismo club f2 y f5 " ~: equiposValidos forms_24p ~?= False,
      -- repetidos jugador
      " mismo jugador f1 y f2 " ~: equiposValidos forms_12v ~?= False,
      " mismo jugador f1 y f4 " ~: equiposValidos forms_14v ~?= False,
      " mismo jugador f3 y f4 " ~: equiposValidos forms_34v ~?= False,
      " mismo jugador f2 y f5 " ~: equiposValidos forms_24v ~?= False,
      -- repetidos cruzados
      " club f1 jugador f2 " ~: equiposValidos forms_12pv ~?= False,
      " jugador f1 club f2 " ~: equiposValidos forms_12vp ~?= False,
      " club f1 jugador f4 " ~: equiposValidos forms_14pv ~?= False,
      " jugador f1 club f4 " ~: equiposValidos forms_14vp ~?= False,
      " club f3 jugador f4 " ~: equiposValidos forms_34pv ~?= False,
      " jugador f3 club f4 " ~: equiposValidos forms_34vp ~?= False,
      " club f2 jugador f5 " ~: equiposValidos forms_25pv ~?= False,
      " jugador f2 club f5 " ~: equiposValidos forms_25vp ~?= False,
      -- varios repetidos
      " goleador repetido f1 f2 " ~: equiposValidos forms_1122 ~?= False,
      " goleador repetido f3 f4 " ~: equiposValidos forms_3344 ~?= False,
      " goleador repetido f2 f5 " ~: equiposValidos forms_2255 ~?= False,
      " goleador flipeado f1 f2 " ~: equiposValidos forms_1221 ~?= False,
      " goleador flipeado f3 f4 " ~: equiposValidos forms_3443 ~?= False,
      " goleador flipeado f2 f5 " ~: equiposValidos forms_2552 ~?= False,
      " varios repetidos en distintos arqueros " ~: equiposValidos forms_varios ~?= False
    ]

-- DATOS

-- goleadores
form0 = []

form1_t = [ab]

form1_f = [aa]

forms_t = [ab, cd, je, fg, hi]

forms_1f = [aa, cd, je]

forms_4f = [cd, je, fg, aa, hi]

forms_5f = [cd, je, fg, hi, aa]

forms_245 = [je, aa, hi, bb, cc]

forms_12p = [ab, ac, je]

forms_14p = [ab, je, fg, ac]

forms_34p = [je, fg, ab, ac]

forms_24p = [je, ab, fg, ac]

forms_12v = [ba, ca, je]

forms_14v = [ba, je, fg, ca]

forms_34v = [je, fg, ba, ca]

forms_24v = [je, ba, fg, ca]

forms_12pv = [ab, ca, fg, je]

forms_12vp = [ca, ab, fg, je]

forms_14pv = [ab, fg, je, ca]

forms_14vp = [ca, fg, je, ab]

forms_34pv = [fg, je, ab, ca]

forms_34vp = [fg, je, ca, ab]

forms_25pv = [fg, je, ab, hi, ca]

forms_25vp = [fg, je, ca, hi, ab]

forms_1122 = [aa, bb, je, hi]

forms_3344 = [je, hi, aa, bb]

forms_2255 = [je, aa, hi, cd, bb]

forms_1221 = [ab, ba]

forms_3443 = [cd, fg, ab, ba]

forms_2552 = [cd, fg, ab, hi, ba]

forms_varios = [ca, fg, bb, ac, gi, fa]

-- Listas
ab = ("a", "b")

cd = ("c", "d")

je = ("j", "e")

fg = ("f", "g")

hi = ("h", "i")

aa = ("a", "a")

bb = ("b", "b")

cc = ("c", "c")

ac = ("a", "c")

ca = ("c", "a")

ba = ("b", "a")

gi = ("g", "i")

fa = ("f", "a")
