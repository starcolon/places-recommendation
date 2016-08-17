module Places.Core (
  readInput
, readInputs
) where

import Text.ParserCombinators.Parsec
import Data.CSV
import Data.List
import Places.CsvInput.Parser as Csv
import Places.Class.Data
import Places.Class.Generic
import Places.Class.Instance

-- | Read in input CSV file and convert them into
-- a list of [Place]
readInput :: String -> IO ([Place])
readInput path = do
  places <- Csv.readPlaceCSV path
  return places

-- | Read in multiple input CSV files
readInputs :: [String] -> IO ([Place])
readInputs paths = do
  places <- Csv.readPlaceCSVs paths
  return places




