module AoC2020.Run (run) where

import AoC2020.DayOne as D1 (dayOneAnswerOne, dayOneAnswerTwo)

-- | Calculates and outputs the answers for each day in the 2020 puzzles.
run :: IO ()
run = do

    --Formatting header
    putStrLn "The answers to 2020 are:"

    --Day One
    dayOneText <- readFile "../../input/2020/input1.txt"
    putStrLn $ "  Day 1\n\tProblem 1: " <> show (D1.dayOneAnswerOne dayOneText) <> "\n\tProblem 2: " <> show (D1.dayOneAnswerTwo dayOneText)