module Main
  ( main
  ) where

import           Text.Edifact.Common  (parseFull)
import           Text.Edifact.D96A    (messageIFCSUM, messageDESADV)
import           Text.Edifact.Inspect (inspect)
import           Text.Edifact.Types   (Value)

import           Control.Monad        ((>=>))
import qualified Data.Text.IO         as TIO (putStrLn, readFile)
import           System.Environment   (getArgs)

main :: IO ()
main = getArgs >>= dispatch

dispatch :: [String] -> IO ()
dispatch ("ifcsum" : filename : _) = readIFCSUM filename
dispatch ("desadv" : filename : _) = readDESADV filename
dispatch _                         = help

readIFCSUM :: FilePath -> IO ()
readIFCSUM =
  let display = either print (TIO.putStrLn . inspect)
  in TIO.readFile >=> display . parseFull messageIFCSUM

readDESADV :: FilePath -> IO ()
readDESADV =
  let display = either print (TIO.putStrLn . inspect)
  in TIO.readFile >=> display . parseFull messageDESADV

help :: IO ()
help = do
  putStrLn "ifcsum <file> : inspect IFCSUM file for revision D96A"
  putStrLn "desadv <file> : inspect DESADV file for revision D96A"
  putStrLn "-h|--help     : this message"
