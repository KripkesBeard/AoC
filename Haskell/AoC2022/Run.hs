module AoC2022.Run (run) where

import AoC2022.DayOne as D1 (dayOneAnswerOne, dayOneAnswerTwo)
import AoC2022.DayTwo as D2 (dayTwoAnswerOne, dayTwoAnswerTwo)


run :: IO ()
run = do

    --Formatting header
    putStrLn "The answers to 2022 are:"

    --Day One
    dayOneText <- readFile "../input/2022/input1.txt"
    putStrLn $ "  Day 1\n\tProblem 1: " <> show (D1.dayOneAnswerOne dayOneText) <> "\n\tProblem 2: " <> show (D1.dayOneAnswerTwo dayOneText)

    --Day Two
    dayTwoText <- readFile "../input/2022/input2.txt"
    putStrLn $ "  Day 2\n\tProblem 1: " <> show (D2.dayTwoAnswerOne dayTwoText) <> "\n\tProblem 2: " <> show (D2.dayTwoAnswerTwo dayTwoText)

    --Format end of section
    putStrLn ""