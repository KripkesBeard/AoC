module AoC2022.Run (run) where

import AoC2022.DayOne as D1 (dayOneAnswerOne, dayOneAnswerTwo)
import AoC2022.DayTwo as D2 (dayTwoAnswerOne, dayTwoAnswerTwo)
import AoC2022.DayThree as D3 (dayThreeAnswerOne, dayThreeAnswerTwo)
import AoC2022.DayFour as D4 (dayFourAnswerOne, dayFourAnswerTwo)
import AoC2022.DayFive as D5 (dayFiveAnswerOne, dayFiveAnswerTwo)
import AoC2022.DaySix as D6 (daySixAnswerOne, daySixAnswerTwo)


run :: IO ()
run = do

    --Formatting header
    putStrLn "The answers to 2022 are:"

    --Day One
    dayOneText <- readFile "input/2022/input1.txt"
    putStrLn $ "  Day 1\n\tProblem 1: " <> show (D1.dayOneAnswerOne dayOneText) <> "\n\tProblem 2: " <> show (D1.dayOneAnswerTwo dayOneText)

    --Day Two
    dayTwoText <- readFile "input/2022/input2.txt"
    putStrLn $ "  Day 2\n\tProblem 1: " <> show (D2.dayTwoAnswerOne dayTwoText) <> "\n\tProblem 2: " <> show (D2.dayTwoAnswerTwo dayTwoText)

    --Day Three
    dayThreeText <- readFile "input/2022/input3.txt"
    putStrLn $ "  Day 3\n\tProblem 1: " <> show (D3.dayThreeAnswerOne dayThreeText) <> "\n\tProblem 2: " <> show (D3.dayThreeAnswerTwo dayThreeText)

    --Day Four
    dayFourText <- readFile "input/2022/input4.txt" 
    putStrLn $ "  Day 4\n\tProblem 1: " <> show (D4.dayFourAnswerOne dayFourText) <> "\n\tProblem 2: " <> show (D4.dayFourAnswerTwo dayFourText)

    --Day Five
    dayFiveText <- readFile "input/2022/input5.txt"
    putStrLn $ "  Day 5\n\tProblem 1: " <> show (D5.dayFiveAnswerOne dayFiveText) <> "\n\tProblem 2: " <> show (D5.dayFiveAnswerTwo dayFiveText)

    --Day Six
    daySixText <- readFile "input/2022/input6.txt"
    putStrLn $ "  Day 6\n\tProblem 1: " <> show (D6.daySixAnswerOne daySixText) <> "\n\tProblem 2: " <> show (D6.daySixAnswerTwo daySixText)