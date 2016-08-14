module Places.Core (
  readInput
) where

import Text.ParserCombinators.Parsec
import Data.CSV
import Data.List
import Places.CsvInput.Parser as Csv
import Places.Class.Data

-- | Read in input CSV file and convert them into
-- a list of [Place]
readInput :: String -> IO ([Place])
readInput path = do
  places <- Csv.readPlaceCSV path
  return places

