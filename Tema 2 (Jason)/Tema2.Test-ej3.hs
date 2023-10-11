module Tema2.Test_ej3 where

import JasonHaskell
import Test.HUnit

main = runTestTT tests

tests =
  test
    [ " arquero 1" ~: algunoCerca (porcentajeDeGoles "b" form5 goles5) (esperado 1 15),
      " arquero 2" ~: algunoCerca (porcentajeDeGoles "d" form5 goles5) (esperado 2 15),
      " arquero 3" ~: algunoCerca (porcentajeDeGoles "e" form5 goles5) (esperado 3 15),
      " arquero 4" ~: algunoCerca (porcentajeDeGoles "g" form5 goles5) (esperado 4 15),
      " arquero 5" ~: algunoCerca (porcentajeDeGoles "i" form5 goles5) (esperado 5 15),
      " arquero unico" ~: algunoCerca (porcentajeDeGoles "b" form5 goles5_0) (esperado 4 4),
      " ulltimo jugador no fue arquero" ~: algunoCerca (porcentajeDeGoles "i" form5 goles5_0) (esperado 0 4),
      " jugador del medio no fue arquero" ~: algunoCerca (porcentajeDeGoles "e" form5 goles5_1) (esperado 0 12),
      " jugador arquero con uno en 0" ~: algunoCerca (porcentajeDeGoles "i" form5 goles5_1) (esperado 5 12),
      " arquero del medio" ~: algunoCerca (porcentajeDeGoles "e" form5 goles5_3) (esperado 1 1),
      " arquero del medio 2" ~: algunoCerca (porcentajeDeGoles "e" form5 goles5_4) (esperado 4 4),
      " arquero solo" ~: algunoCerca (porcentajeDeGoles "b" form1 goles1) (esperado 5 5)
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

goles5 = [1, 2, 3, 4, 5]

goles5_0 = [4, 0, 0, 0, 0]

goles5_1 = [1, 2, 0, 4, 5]

goles5_2 = [1, 2, 3, 4, 0]

goles5_3 = [0, 0, 1, 0, 0]

goles5_4 = [0, 0, 4, 0, 0]

-- FUNCIONES PARA TESTING, NO BORRAR
-- expectAny permite saber si el elemento que devuelve la función es alguno de los esperados
expectAny actual expected = elem actual expected ~? ("expected any of: " ++ show expected ++ "\n but got: " ++ show actual)

-- lo mismo que expectAny pero dando margen de error
algunoCerca actual [expected1, expected2] = abs (actual - expected1) < 0.01 || abs (actual - expected2) < 0.0001 ~? ("expected any of: " ++ show [expected1, expected2] ++ "\n but got: " ++ show actual)

mi_porcentaje a b = fromIntegral a / fromIntegral b * 100 -- le pongo este nombre para evitar conflictos con las funciones de los alumnos

proporcion a b = fromIntegral a / fromIntegral b

esperado votos votosAfirmativos = [mi_porcentaje votos votosAfirmativos, proporcion votos votosAfirmativos]
