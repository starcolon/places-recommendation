module Main where

{- Ideally, Main just needs to includes only {Place.Core} -}
import Places.Core as Pl

main :: IO()
main = do
  -- Reads in CSV data files
  let inputs = [ "./data/amsterdam-attraction.csv"
                ,"./data/barcelona-attraction.csv"
                ,"./data/berlin-attraction.csv"
                ,"./data/dubai-attraction.csv"
                ,"./data/london-attraction.csv"
                ,"./data/paris-attraction.csv"
                ,"./data/rome-attraction.csv"
                ,"./data/tuscany-attraction.csv"
               ]
  places  <- Pl.readInputsAsTree inputs
  _       <- putStrLn $ show places
  putStrLn "==========================="
  print "Where are you (e.g. Sé de Lisboa)?" -- TAOTODO: To be decoded with Google Geocoding API
  loc     <- getLine
  print "How far in metres from your location you want to explore?"
  d      <- getLine
  let dist = read d :: Integer
  print "OK, here is the list of what we found:"

  return ()