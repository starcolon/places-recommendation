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
  places  <- Pl.readInputs inputs
  _       <- putStrLn $ show places
  -- TAOTODO: Convert List[Places] -> [PlaceList]
  return ()