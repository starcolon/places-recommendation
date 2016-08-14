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


-- | Convert a list of values to a [Place] data
toPlace :: [String] -> Place
toPlace ns = PlaceData.fromList ns


readPlaceCSV :: String -> IO ([Place])
readPlaceCSV path = do
  csv <- readCSV path
  let places = map toPlace csv
    in return places
  