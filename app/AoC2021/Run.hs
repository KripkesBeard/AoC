module AoC2021.Run (run) where

import AoC2021.DayOne as D1 (dayOneAnswerOne, dayOneAnswerTwo)
import AoC2021.DayTwo as D2 (dayTwoAnswerOne, dayTwoAnswerTwo)

-- | Calculates and outputs the answers for each day in the 2021 puzzles.
run :: IO ()
run = do

    --Formatting header
    putStrLn "The answers to 2021 are:"

    --Day One
    dayOneText <- readFile "input/2021/input1.txt"
    putStrLn $ "  Day 1\n\tProblem 1: " <> show (D1.dayOneAnswerOne dayOneText) <> "\n\tProblem 2: " <> show (D1.dayOneAnswerTwo dayOneText)

    --Day Two
    dayTwoText <- readFile "input/2021/input2.txt"
    putStrLn $ "  Day 2\n\tProblem 1: " <> show (D2.dayTwoAnswerOne dayTwoText) <> "\n\tProblem 2: " <> show (D2.dayTwoAnswerTwo dayTwoText)