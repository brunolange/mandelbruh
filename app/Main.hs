module Main where

import Mandelbruh
import Data.Complex

answer :: RealFloat a => Complex a -> String
answer z = if (inMandelbrot z) then "Yes!" else "nope"

readc z = read z :: Complex Float

main :: IO ()
main = do
    putStrLn "Gimme a complex number: (a :+ b)"
    line <- getLine
    let z = readc line
    putStrLn $ "Is " ++ show z ++ " in the Mandelbrot set? " ++ (answer z)
