module Places.Core (
  readInput
) where

import Text.ParserCombinators.Parsec
import Data.CSV
import Data.List
import Places.CsvInput.Parser as Csv
import Places.Class.Data

-- TAODEBUG:
readInput :: String -> IO ([[String]])
readInput path = do
  csv <- Csv.readCSV path
  let join = intercalate ","
    in putStrLn $ join $ head csv
  return csv