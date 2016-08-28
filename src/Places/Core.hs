module Places.Core (
  readInput
, readInputs
) where

import Text.ParserCombinators.Parsec
import Data.CSV
import Data.List
import Places.CsvInput.Parser as Csv
import Places.Class.Data
import Places.Class.Instance as I

-- | Read in input CSV file and convert them into
-- a list of [Place]
readInput :: String -> IO [Place]
readInput path = do
  places <- Csv.readPlaceCSV path
  return places

-- | Read in multiple input CSV files
readInputs :: [String] -> IO [Place]
readInputs paths = do
  places <- Csv.readPlaceCSVs paths
  return places

-- | Read in multiple input CSV files as a [PlaceTree] class
readInputsAsTree :: [String] -> IO PlaceTree
readInputsAsTree paths = do
  places <- Csv.readPlaceCSVs paths
  let tree = I.placeTree places
    in return tree

-- | Convert a List of [Place] to a [PlaceTree] class
placeTree :: [Place] -> PlaceTree
placeTree = I.placeTree
