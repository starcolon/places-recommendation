module Main where

{- Ideally, Main just needs to includes only {Place.Core} -}
import Places.Core as Pl

main :: IO()
main = do
  places <- Pl.readInput "./data/amsterdam-attraction.csv"
  _      <- putStrLn $ show places
  return ()