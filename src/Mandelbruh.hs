module Mandelbruh
    ( C,
      mandelbruh,
      inMandelbrot,
      color,
      series
    ) where

import Data.Complex

type C = Complex Float

f :: C -> C -> C
f c z = z^2 + c

type Series = [C]

series :: C -> Series
series c = iterate (f c) c

inMandelbrot :: C -> Bool
inMandelbrot =
  let ceiling = 100 -- TODO: move to config file
      samples = 20
      in all (< ceiling) . map magnitude . take samples . series

mandelbruh = 42

readComplex :: String -> C
readComplex s = read s :: C

type Color = Char
type Palette = [Color]

color :: Palette -> Series -> Color
color palette = (palette !!) . length . take n . takeWhile fairlyClose
  where n = length palette - 1
        fairlyClose c = magnitude c < ceiling
        ceiling = 100

type Image color = C -> color
