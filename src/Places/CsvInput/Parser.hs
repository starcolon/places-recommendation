module Places.CsvInput.Parser where

import Text.ParserCombinators.Parsec
import Data.CSV
import Places.Class.Data as PlaceData

-- | Read CSV file into lists of values
-- The function omits the first line
readCSV :: String -> IO ([[String]])
readCSV path = do 
  csv <- parseFromFile csvFile path
  case csv of
    -- ParseException
    Left _ -> do
      putStrLn "ERROR Parsing CSV input"
      return []
    Right (n:ns) -> return ns


-- | Read multiple CSV files and merge the results
-- into one single list of [String]
readCSVs :: [String] -> IO ([[String]])
readCSVs paths = do
  csvs <- sequence $ map readCSV paths
  let csv = concat csvs
  return csv


mergeCSVs :: [IO [[String]]] -> IO [[String]]
mergeCSVs inputs = do
  error "HHH"

-- | Convert a list of values to a [Place] data
toPlace :: [String] -> Maybe Place
toPlace ns = PlaceData.fromList ns


-- | Filter only valid [Place] out of the list of [Maybe Place]
filterValid :: [Maybe Place] -> [Place]
filterValid ((Just p):ps) = p:(filterValid ps)
filterValid (Nothing:ps)  = filterValid ps
filterValid []            = []


readPlaceCSV :: String -> IO ([Place])
readPlaceCSV path = do
  csv <- readCSV path
  let { places  = map toPlace csv
      ; places' = filterValid places
    }
    in return places'
  