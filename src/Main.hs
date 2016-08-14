module Main where

{- Ideally, Main just needs to includes only {Place.Core} -}
import Places.Core as Pl

main :: IO()
main = do
  csv <- Pl.readInput "./data/amsterdam-attraction.csv"
  return ()