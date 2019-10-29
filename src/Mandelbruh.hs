module Mandelbruh
    ( mandelbruh,
      someFunc,
      f,
      series,
      inMandelbruh
    ) where

import Data.Complex

f :: RealFloat a => Complex a -> Complex a -> Complex a
f c z = z^2 + c

series :: RealFloat a => Complex a -> [Complex a]
series c = iterate (f c) 0

inMandelbruh :: RealFloat a => Complex a -> Bool
inMandelbruh c = all closeEnough $ take 20 $ series c
        where closeEnough z = (realPart z) * (realPart z) + (imagPart z)*(imagPart z) < 100

mandelbruh = 42

someFunc :: IO ()
someFunc = putStrLn "someFunc"
