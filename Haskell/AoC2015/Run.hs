module AoC2015.Run (run) where

import AoC2015.DayOne (dayOneAnswerOne)

-- | Calculates and outputs the answers for each day in the 2015 puzzles.
run :: IO ()
run = do

    --Format header
    putStrLn "The answers to 2015 are:"

    --Day One
    dayOneText <- readFile "input/2015/input1.txt"
    putStrLn $ "Day 1\n\tProblem 1: " <> show (dayOneAnswerOne dayOneText) 

    --Format end of section
    putStrLn ""