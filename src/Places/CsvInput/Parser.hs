module Places.CsvInput.Parser where

import Text.ParserCombinators.Parsec
import Data.CSV
import Places.Class.Data

-- | Read CSV file 
readCSV :: String -> IO ([[String]])
readCSV path = do 
  csv <- parseFromFile csvFile path
  case csv of
    -- ParseException
    Left _ -> do
      putStrLn "ERROR Parsing CSV input"
      return []
    Right (n:ns) -> return ns

-- toPlace :: [String] -> IO (Place)
-- toPlace vs = -- TAOTODO: