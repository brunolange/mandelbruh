module Mandelbruh
    ( mandelbruh,
      inMandelbrot
    ) where

import Data.Complex

f :: RealFloat a => Complex a -> Complex a -> Complex a
f c z = z^2 + c

series :: RealFloat a => Complex a -> [Complex a]
series c = iterate (f c) 0

inMandelbrot :: RealFloat a => Complex a -> Bool
inMandelbrot =
  let ceiling = 100
      samples = 20
      in all (< ceiling) . map magnitude . take samples . series

mandelbruh = 42

readComplex :: String -> Complex Float
readComplex s = read s :: Complex Float