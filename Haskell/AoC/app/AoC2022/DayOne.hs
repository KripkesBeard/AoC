module AoC2022.DayOne (dayOneAnswerOne, dayOneAnswerTwo) where

import Data.List (sort)
import Data.List.Split (splitOn)



-- Problem 1


-- | Reads a String to an Int, but replaces the empty string with 0. This could be a fold.
readToInt :: String -> Int
readToInt x
  | x == ""  = 0
  | otherwise = read x

-- | Splits a list of ints into a list of sublists, splitting at 0
splitAtZero :: [Int] -> [[Int]]
splitAtZero = splitOn [0]

-- | Lines the input, read it into a list of ints separated by zeros, split into a list of lists, sum those interior lists, take the largest value
-- 
-- Answer to my data is 66616
dayOneAnswerOne :: String -> Int
dayOneAnswerOne = maximum . fmap sum . splitAtZero . fmap readToInt . lines


-- Problem 2


-- | Same as first answer, but reverse the lis and take the first three and sum them instead of just taking the single biggest
-- 
-- Answer to my data is 199172
dayOneAnswerTwo :: String -> Int
dayOneAnswerTwo = sum . take 3 . reverse . sort . fmap sum . splitAtZero . fmap readToInt . lines